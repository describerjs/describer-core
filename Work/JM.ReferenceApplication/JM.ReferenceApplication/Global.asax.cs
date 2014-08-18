using JM.Foundation.DependencyInjection;
using JM.Foundation.Utils;
using JM.ReferenceApplication.App_Start;
using JM.ReferenceApplication.Common.Monitoring;
using System;
using System.Web.Hosting;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace JM.ReferenceApplication
{
	public class MvcApplication : System.Web.HttpApplication
	{
		/// <summary>
		/// Wird beim Start der Application ausgeführt
		/// </summary>
		protected void Application_Start()
		{
			// MVC Bootstrapping
			AreaRegistration.RegisterAllAreas();
			FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
			RouteConfig.RegisterRoutes(RouteTable.Routes);
			BundleConfig.RegisterBundles(BundleTable.Bundles);
			AutoFacConfig.RegisterDependencyResolver();

			// Information Disclosure: MVC-Header entfernen
			MvcHandler.DisableMvcResponseHeader = true;

			// Eventlogging

			// Startet das Event-Handling über EventSource
			ApplicationEvents.Log.Initialize();

			// Logaufruf: Start der Application
			ApplicationEvents.Log.ApplicationStartup();

			// Um für Post-Actions keine Model in der Web.dll definieren zu müssen,
			// wird ein eigener Modelbinder eingesetzt. Dieser erkennt über die AutoFac-Dependencyinjection
			// welche Klasse instanziiert werden muss und führt das aus. Somit können in PostActions
			// Interfaces als Actions übergeben werden.
            ModelBinders.Binders.DefaultBinder = new AbstractModelBinder(DependencyResolver.Current);
            
            HostingEnvironment
                .RegisterVirtualPathProvider(new EmbeddedViewPathProvider(typeof(FaqRegion).Assembly));
		}

		/// <summary>
		/// Wird vor dem Senden der Response ausgeführt
		/// Löscht den "Server"-Header, Security/Obfuscation
		/// </summary>
		/// <param name="sender">object Sender</param>
		/// <param name="e">EventArgs e</param>
		protected void Application_PreSendRequestHeaders(object sender, EventArgs e)
		{
			var app = sender as MvcApplication;

            if (app == null || app.Context == null)
            {
                return;
            }

			var headers = app.Context.Response.Headers;
			headers.Remove("Server");
		}
	}
}