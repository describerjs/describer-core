using System.Web;
using System.Web.Routing;
using joinmedia.Infrastructure.LandingPage;

namespace joinmedia.Infrastructure
{
	public class LandingPageConstraint : IRouteConstraint
	{
		public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
		{
			var lpKey = values[parameterName] as string;

			return LandingPageHandler.LandingPages.ContainsKey(lpKey);
		}
	}
}