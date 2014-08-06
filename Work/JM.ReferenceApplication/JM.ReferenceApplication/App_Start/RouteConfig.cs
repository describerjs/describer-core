using System.Web.Mvc;
using System.Web.Routing;

namespace JM.ReferenceApplication
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Login",
                url: "Login/{action}/{id}",
                defaults: new { controller = "Login", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "JM.ReferenceApplication.Controllers" })
                .DataTokens["UseNamespaceFallback"] = false;

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "JM.ReferenceApplication.Controllers" })
                .DataTokens["UseNamespaceFallback"] = false;
        }
    }
}
