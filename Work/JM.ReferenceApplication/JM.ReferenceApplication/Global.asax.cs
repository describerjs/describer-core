using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Autofac;
using Autofac.Core;
using Autofac.Extras.DynamicProxy2;
using Autofac.Integration.Mvc;
using JM.Business.Data;
using JM.Business.Manager;
using Castle.DynamicProxy;
using System.Diagnostics;
using JM.Foundation;
using JM.Foundation.ErrorHandling;
using Microsoft.Practices.EnterpriseLibrary.SemanticLogging.Formatters;
using Microsoft.Practices.EnterpriseLibrary.SemanticLogging.Sinks;
using Microsoft.Practices.EnterpriseLibrary.SemanticLogging;
using JM.Foundation.Logging;

namespace JM.ReferenceApplication
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

	        var autofacBuilder = new Autofac.ContainerBuilder();
	        autofacBuilder.RegisterControllers(typeof (MvcApplication).Assembly);
	        autofacBuilder.RegisterType<ExampleDataRepository>().As<IExampleDataRepository>();

            autofacBuilder
                .RegisterType<ErrorInterceptor>();

            autofacBuilder.RegisterInstance<IErrorHandler>(new ErrorHandler());

            autofacBuilder
                .RegisterType<ImportantManager>()
                .As<IImportantManager>()
                .EnableInterfaceInterceptors()
                .InterceptedBy(typeof(ErrorInterceptor));

			autofacBuilder.RegisterType<LameManager>().As<ILameManager>();
	        var container = autofacBuilder.Build();
			DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
            //EventTextFormatter formatter = new EventTextFormatter();
            //DefaultConsoleColorMapper colorMapper = new DefaultConsoleColorMapper();
            //ConsoleSink sink = new ConsoleSink(formatter, colorMapper);
            var listener = Microsoft.Practices.EnterpriseLibrary.SemanticLogging.ConsoleLog.CreateListener();
            listener.EnableEvents(CommonTraceEvents.Log, System.Diagnostics.Tracing.EventLevel.LogAlways);
        }
    }

    public class ErrorInterceptor : IInterceptor
    {
        IErrorHandler handler;

        public ErrorInterceptor(IErrorHandler handler)
        {
            this.handler = handler;
        }

        public void Intercept(IInvocation invocation)
        {
            try
            {
                invocation.Proceed();
            }
            catch (Exception ex)
            {
                HandleInternal(ex, invocation);
            }
        }

        private void HandleInternal(Exception ex, IInvocation invocation)
        {
            string businessContext = string.Empty;
            BusinesImpact impact = BusinesImpact.Low;

            var methodAttribute =
                (SystemBoundaryAttribute)invocation
                .Method
                .GetCustomAttributes(typeof(SystemBoundaryAttribute), true)
                .FirstOrDefault();

            if (methodAttribute != null)
            {
                businessContext = methodAttribute.BusinessContext;
                impact = methodAttribute.Impact;
            }
            else
            {
                var attribute =
                    (SystemBoundaryAttribute)invocation
                    .Method
                    .DeclaringType
                    .GetCustomAttributes(typeof(SystemBoundaryAttribute), true)
                    .FirstOrDefault();

                if (attribute != null)
                {
                    businessContext = attribute.BusinessContext;
                }
            }

            this.handler.Handle(ex, ExceptionPolicy.LogAndReplace, businessContext);
        }
    }
}