using System;
using System.Web.Routing;

namespace JM.Foundation.Extensions
{
	/// <summary>
	/// Erweiterung der Route vereinfacht das setzen und lesen zusätzlicher Werte in Routen
	/// </summary>
	public static class RouteExtension
	{
		public static string GetRouteValue(this Route route, string key)
		{
			if (route == null)
			{
				return null;
			}
			return route.DataTokens.GetRouteValue(key);
		}

		public static string GetRouteValue(this RouteData routeData, string key)
		{
			if (routeData == null)
			{
				return null;
			}
			return routeData.DataTokens.GetRouteValue(key);
		}

		public static string GetRouteValue(this RouteValueDictionary routeValues, string key)
		{
			if (routeValues == null)
			{
				return null;
			}
			object routeName = null;
			routeValues.TryGetValue(key, out routeName);
			return routeName as string;
		}

		public static Route SetRouteName(this Route route, string routeName, string key)
		{
			if (route == null)
			{
				throw new ArgumentNullException("route");
			}
			if (route.DataTokens == null)
			{
				route.DataTokens = new RouteValueDictionary();
			}
			route.DataTokens[key] = routeName;
			return route;
		}
	}
}