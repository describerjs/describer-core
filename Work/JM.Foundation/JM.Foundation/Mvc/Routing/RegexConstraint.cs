using System;
using System.Diagnostics.Contracts;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Routing;

namespace JM.Foundation.Mvc.Routing
{
    /// <summary>
    /// Angepasster Constraint für das begrenzen von Routen mittels regex.
    /// </summary>
    /// <remarks>http://samsaffron.com/archive/2011/10/13/optimising-asp-net-mvc3-routing</remarks>
    public class RegexConstraint : IRouteConstraint, IEquatable<RegexConstraint>
    {
        private readonly Regex _regex;

        public RegexConstraint(
            string pattern, 
            RegexOptions options = RegexOptions.CultureInvariant | RegexOptions.Compiled | RegexOptions.IgnoreCase)
        {
            Contract.Requires(!string.IsNullOrWhiteSpace(pattern));
            _regex = new Regex(pattern, options);
        }

        public bool Match(
            HttpContextBase httpContext, 
            Route route, 
            string parameterName, 
            RouteValueDictionary values, 
            RouteDirection routeDirection)
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
            if (other == null)
            {
                return false;
            }

            Contract.Assume(other._regex != null);

            return 
                string.Equals(
                    _regex.ToString(), 
                    other._regex.ToString(), 
                    StringComparison.Ordinal);
        }

        #endregion

        [ContractInvariantMethod]
        private void ObjectInvariant()
        {
            Contract.Invariant(_regex != null);
        }
    }
}