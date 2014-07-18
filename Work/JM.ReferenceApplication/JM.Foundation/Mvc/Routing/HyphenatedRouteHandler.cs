using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace JM.Foundation.Mvc.Routing
{
	/// <summary>
	/// RouteHandler schreibt die Requests an Controller und Actions um, die einen Bindestrich enthalten.
	/// Der Bindestrich wird mit einem Underscore ersetzt, da Bindestriche in Controller und Actionnamen
	/// nicht erlaubt sind. Mehr Info:
	/// http://stackoverflow.com/questions/2070890/asp-net-mvc-support-for-urls-with-hyphens
	/// http://stackoverflow.com/questions/5281465/allow-hyphens-in-urls-for-asp-net-mvc-2-controller-names
	/// </summary>
	public class HyphenatedRouteHandler : MvcRouteHandler
	{
		protected override IHttpHandler GetHttpHandler(RequestContext requestContext)
		{
			requestContext.RouteData.Values["controller"] = requestContext.RouteData.Values["controller"].ToString().Replace("-", "_");
			requestContext.RouteData.Values["action"] = requestContext.RouteData.Values["action"].ToString().Replace("-", "_");

			return base.GetHttpHandler(requestContext);
		}
	}
}
