using JM.ReferenceApplication.App_Start;
using JM.ReferenceApplication.Common.Monitoring;
using System;
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
			//////////////////////////////////////////////////////////////////////////////////////
			#region MVC Bootstrapping

			AreaRegistration.RegisterAllAreas();
			FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
			RouteConfig.RegisterRoutes(RouteTable.Routes);
			BundleConfig.RegisterBundles(BundleTable.Bundles);
			AutoFacConfig.RegisterDependencyResolver();

			// Information Disclosure: MVC-Header entfernen
			MvcHandler.DisableMvcResponseHeader = true;

			#endregion

			//////////////////////////////////////////////////////////////////////////////////////
			#region Eventlogging
			
			// Startet das Event-Handling über EventSource
			ApplicationEvents.Log.Initialize();

			// Logaufruf: Start der Application
			ApplicationEvents.Log.ApplicationStartup();

			#endregion
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
				return;

			var headers = app.Context.Response.Headers;
			headers.Remove("Server");
		}
	}
}