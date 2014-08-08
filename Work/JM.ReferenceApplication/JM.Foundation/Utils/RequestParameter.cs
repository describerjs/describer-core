using JM.Foundation.Extensions;
using System;
using System.Text.RegularExpressions;
using System.Web;

namespace JM.Foundation.Utils
{
	/// <summary>
	/// Kapselt das verifizieren von POST / GET Parametern ab und
	/// spart so ein bischen Hackerei und Unübersichtlichkeit
	/// </summary>
	public static class RequestParameter
	{
		/// <summary>
		/// Liest den angegebenden POST-Parameter und gibt den Wert oder string.Empty zurück
		/// </summary>
		/// <param name="parameterName">Name des POST-Parameters</param>
		/// <returns>string Wert</returns>
		public static string ReadPost(string parameterName)
		{
            if (HttpContext.Current.Request.Form[parameterName] != null && !string.IsNullOrEmpty(HttpContext.Current.Request.Form[parameterName].ToString()))
            {
                return HttpContext.Current.Request.Form[parameterName].ToString();
            }

			return string.Empty;
		}

		/// <summary>
		/// Liest den angegebenden POST-Parameter und gibt den Wert oder den angegebenen Defaultwert zurück
		/// </summary>
		/// <param name="parameterName">Name des POST-Parameters</param>
		/// <param name="fallback">Defaultvalue</param>
		/// <returns>string Wert</returns>
		/// /// <returns>string Defaultwert</returns>
		public static string ReadPost(string parameterName, string fallback)
		{
			string result = ReadPost(parameterName);
			return string.IsNullOrEmpty(result) ? fallback : result;
		}

		/// <summary>
		/// Liest den angegebenden POST-Parameter und beschränkt den Returnwert auf den Regex "[^a-zA-Z0-9 _-]"
		/// </summary>
		/// <param name="parameterName">Name des POST-Parameters</param>
		/// <param name="alphaNumericOnly">nur alphanumerische Zeichen zurückgeben</param>
		/// <returns>string Wert</returns>
		public static string ReadPost(string parameterName, bool alphaNumericOnly)
		{
			string result = ReadPost(parameterName);

			if (alphaNumericOnly && !string.IsNullOrEmpty(result))
			{
				result = result.AlphanumericOnly();
			}

			return result;
		}

		/// <summary>
		/// Liest den angegebenden GET-Parameter und gibt den Wert oder string.Empty zurück
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
		/// <param name="fallback">Defaultvalue</param>
		/// <returns>string Defaultwert</returns>
		public static string ReadGet(string parameterName, string fallback)
		{
			var result = ReadGet(parameterName, false, false);
			return string.IsNullOrEmpty(result) ? fallback : result;
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
		/// Liest den angegebenden GET-Parameter und gibt den Wert oder string.Empty zurück
		/// </summary>
		/// <param name="parameterName">Name des GET-Parameters</param>
		/// <param name="alphaNumericOnly">Allow only latin characters, numbers, space, underscore and a minus character</param>
		/// <param name="unfiltered">Nicht filtern</param>
		/// <returns></returns>
		public static string ReadGet(string parameterName, bool alphaNumericOnly, bool unfiltered)
		{
			var result =
                (HttpContext.Current.Request.QueryString[parameterName] != null &&
                !string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[parameterName].ToString())) ?
                    HttpContext.Current.Request.QueryString[parameterName].ToString() :
                    string.Empty;

            if (alphaNumericOnly && !string.IsNullOrEmpty(result))
            {
                return result.AlphanumericOnly();
            }

			// filter the result
			var re = new Regex("[^a-zA-Z0-9 _\\-ÄäÖöÜüß]");
			result = re.Replace(result, string.Empty);
			return result;
		}

		/// <summary>
		/// Liefert aus einem Url-String einen gewünschten Parameter
		/// Default-Rückgabe = string.Empty
		/// </summary>
		/// <param name="url"></param>
		/// <param name="paramName"></param>
		/// <returns></returns>
		public static string GetValueFromUrl(string url, string paramName)
		{
            if (string.IsNullOrWhiteSpace(url) || string.IsNullOrWhiteSpace(paramName))
            {
                return string.Empty;
            }

            Uri uri = null;

            if (Uri.TryCreate(url, UriKind.RelativeOrAbsolute, out uri))
            {
                var query =
                    uri.IsAbsoluteUri ?
                    uri.Query :
                    uri.OriginalString;

                return
                    HttpUtility
                    .ParseQueryString(query)
                    .Get(paramName) ?? string.Empty;
            }
            else
            {
                return string.Empty;
            }
		}
	}
}
