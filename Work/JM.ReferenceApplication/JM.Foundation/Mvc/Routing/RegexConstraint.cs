using System;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Web.Routing;

namespace JM.Foundation.Mvc.Routing
{
	/// <summary>
	/// Angepasster Constraint für das begrenzen von Routen mittels regex.
	/// </summary>
    /// <remarks>http://samsaffron.com/archive/2011/10/13/optimising-asp-net-mvc3-routing</remarks>
	public class RegexConstraint : IRouteConstraint, IEquatable<RegexConstraint>
	{
		private Regex _regex;

		public RegexConstraint(string pattern, RegexOptions options = RegexOptions.CultureInvariant | RegexOptions.Compiled | RegexOptions.IgnoreCase)
		{
			_regex = new Regex(pattern, options);
		}

		public bool Match(System.Web.HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
		{
			object val;
			values.TryGetValue(parameterName, out val);
			string input = Convert.ToString(val, CultureInfo.InvariantCulture);
			return _regex.IsMatch(input);
		}

		#region Implementation of IEquatable<RegexConstraint>

		/// <summary>
		/// Gibt an, ob das aktuelle Objekt einem anderen Objekt des gleichen Typs entspricht.
		/// </summary>
		/// <returns>
		/// true, wenn das aktuelle Objekt gleich dem <paramref name="other"/>-Parameter ist, andernfalls false.
		/// </returns>
		/// <param name="other">Ein Objekt, das mit diesem Objekt verglichen werden soll.</param>
		public bool Equals(RegexConstraint other)
		{
			throw new NotImplementedException();
		}

		#endregion
	}
}