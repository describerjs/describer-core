using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Autofac;
using Autofac.Core;
using Autofac.Integration.Mvc;
using JM.Business.Data;
using JM.Business.Manager;

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
			autofacBuilder.RegisterType<ImportantManager>().As<IImportantManager>();
			autofacBuilder.RegisterType<LameManager>().As<ILameManager>();

	        var container = autofacBuilder.Build();
			DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
    }
}