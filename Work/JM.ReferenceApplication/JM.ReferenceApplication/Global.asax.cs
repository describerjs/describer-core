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
using JM.ReferenceApplication.Common.Monitoring;

namespace JM.ReferenceApplication
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            ApplicationEvents.Log.Initialize();
            ApplicationEvents.Log.ApplicationStartup();
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
                .EnableInterfaceInterceptors();

			autofacBuilder.RegisterType<LameManager>().As<ILameManager>();
	        var container = autofacBuilder.Build();
			DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
    }
}