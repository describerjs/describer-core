using System.Web.Mvc;
using System.Web.Routing;

namespace JM.ReferenceApplication
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

			routes
                .MapRoute(
				    name: "Login",
				    url: "Login/{action}/{id}",
				    defaults: new { controller = "Login", action = "Index", id = UrlParameter.Optional },
				    namespaces: new[] { "JM.ReferenceApplication.Controllers" })
                .DataTokens["UseNamespaceFallback"] = false;
			
			// Routing für Controlleractions in der Foundation.dll. Müssen hier explizit deklariert werden, damit sie nicht das Catchall von Piranha verderben.
			routes
				.MapRoute(
					name: "DefaultPiranha",
					url: "PiranhaModel/{action}/{id}",
					defaults: new { controller = "PiranhaModel", action = "Index", id = UrlParameter.Optional },
					namespaces: new[] { "JM.Foundation.Piranha.Controller" });

			routes
                .MapRoute(
				    name: "Default",
				    url: "{controller}/{action}/{id}",
				    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
				    namespaces: new[] { "JM.ReferenceApplication.Controllers" })
                .DataTokens["UseNamespaceFallback"] = false;

        }
    }
}
