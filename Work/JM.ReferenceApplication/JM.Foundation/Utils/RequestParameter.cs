using JM.Foundation.Extensions;
using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace JM.Foundation.Utils
{
	/// <summary>
	/// Kapselt das verifizieren von POST / GET Parametern ab und
	/// spart so ein bischen Hackerei und Unübersichtlichkeit
	/// </summary>
	public class RequestParameter
	{
		/// <summary>
		/// Liest den angegebenden POST-Parameter und gibt den Wert oder String.Empty zurück
		/// </summary>
		/// <param name="parameterName">Name des POST-Parameters</param>
		/// <returns>string Wert</returns>
		public static string ReadPost(string parameterName)
		{
			if (HttpContext.Current.Request.Form[parameterName] != null && !String.IsNullOrEmpty(HttpContext.Current.Request.Form[parameterName].ToString()))
				return HttpContext.Current.Request.Form[parameterName].ToString();

			return String.Empty;
		}

		/// <summary>
		/// Liest den angegebenden POST-Parameter und gibt den Wert oder den angegebenen Defaultwert zurück
		/// </summary>
		/// <param name="parameterName">Name des POST-Parameters</param>
		/// <returns>string Wert</returns>
		/// /// <returns>string Defaultwert</returns>
		public static string ReadPost(string parameterName, string fallback)
		{
			string result = ReadPost(parameterName);
			return (String.IsNullOrEmpty(result)) ? fallback : result;
		}

		/// <summary>
		/// Liest den angegebenden POST-Parameter und beschränkt den Returnwert auf den Regex "[^a-zA-Z0-9 _-]"
		/// </summary>
		/// <param name="parameterName">Name des POST-Parameters</param>
		/// <returns>string Wert</returns>
		public static string ReadPost(string parameterName, bool alphaNumericOnly)
		{
			string result = ReadPost(parameterName);

			if (alphaNumericOnly && !String.IsNullOrEmpty(result))
			{
				result = result.AlphanumericOnly();
			}

			return result;
		}

		/// <summary>
		/// Liest den angegebenden GET-Parameter und gibt den Wert oder String.Empty zurück
		/// </summary>
		/// <param name="parameterName">Name des GET-Parameters</param>
		/// <returns>string Wert</returns>
		public static string ReadGet(string parameterName)
		{
			return ReadGet(parameterName, false, false);
		}

		/// <summary>
		/// Liest den angegebenden GET-Parameter und gibt den Wert oder den angegebenen Defaultwert zurück
		/// </summary>
		/// <param name="parameterName">Name des GET-Parameters</param>
		/// <returns>string Defaultwert</returns>
		public static string ReadGet(string parameterName, string fallback)
		{
			var result = ReadGet(parameterName, false, false);
			return (String.IsNullOrEmpty(result)) ? fallback : result;
		}

		/// <summary>
		/// Liest den angegebenden GET-Parameter und beschränkt den Returnwert auf den Regex "[^a-zA-Z0-9 _-]"
		/// </summary>
		/// <param name="parameterName">Name des GET-Parameters</param>
		/// <param name="alphaNumericOnly">Allow only latin characters, numbers, space, underscore and a minus character</param>
		/// <returns>string Wert</returns>
		public static string ReadGet(string parameterName, bool alphaNumericOnly)
		{
			return ReadGet(parameterName, alphaNumericOnly, false);
		}

		/// <summary>
		/// Liest den angegebenden GET-Parameter und gibt den Wert oder String.Empty zurück
		/// </summary>
		/// <param name="parameterName">Name des GET-Parameters</param>
		/// <param name="alphaNumericOnly">Allow only latin characters, numbers, space, underscore and a minus character</param>
		/// <returns></returns>
		public static string ReadGet(string parameterName, bool alphaNumericOnly, bool unfiltered)
		{
			var result =
                (HttpContext.Current.Request.QueryString[parameterName] != null &&
                !String.IsNullOrEmpty(HttpContext.Current.Request.QueryString[parameterName].ToString())) ?
                    HttpContext.Current.Request.QueryString[parameterName].ToString() :
                    string.Empty;

			if (alphaNumericOnly && !String.IsNullOrEmpty(result))
				return result.AlphanumericOnly();

			// filter the result
			var re = new Regex("[^a-zA-Z0-9 _\\-ÄäÖöÜüß]");
			result = re.Replace(result, "");
			return result;
		}

		/// <summary>
		/// Liefert aus einem Url-String einen gewünschten Parameter
		/// Default-Rückgabe = String.Empty
		/// </summary>
		/// <param name="url"></param>
		/// <param name="paramName"></param>
		/// <returns></returns>
		public static string GetValueFromUrl(string url, string paramName)
		{
			if (string.IsNullOrEmpty(url) || string.IsNullOrEmpty(paramName))
				return String.Empty;

			// uns interressiert nur alles nach dem letzten ?
			if (url.Contains("?"))
				url = url.Split('?').Last();

			var parameters = url.Split('&');
			
            foreach (var parameter in parameters)
			{
				var parr = parameter.Split('=');
				if (parr[0] != null && parr[0].ToLower() == paramName.ToLower() && parr[1] != null)
				{
					return parr[1];
				}
			}

			return String.Empty;
		}
	}
}
