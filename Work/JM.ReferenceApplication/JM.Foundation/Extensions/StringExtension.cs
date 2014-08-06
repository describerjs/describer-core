using Microsoft.Security.Application;
using System;
using System.Text.RegularExpressions;

namespace JM.Foundation.Extensions
{
	public static class StringExtension
	{
		#region public static string HtmlEncode(this String s)

		/// <summary>
		/// Encodiert den String XSS-Sicher für die Verwendung in HTML-Code
		/// (Microsoft Anti-Cross Site Scripting Library V1.5)
		/// </summary>
		/// <param name="s">this</param>
		/// <returns>XSS-Sicheren encodierten String</returns>
		public static string HtmlEncode(this String s)
		{
			if (!String.IsNullOrEmpty(s))
			{
				return Encoder.HtmlEncode(s);
			}
			return String.Empty;
		}

		#endregion

		#region public static string HtmlAttributeEncode(this String s)

		/// <summary>
		/// Encodiert den String XSS-Sicher für die Verwendung in einem HTML-Attribut
		/// (Microsoft Anti-Cross Site Scripting Library V1.5)
		/// </summary>
		/// <param name="s">this</param>
		/// <returns>XSS-Sicheren encodierten String</returns>
		public static string HtmlAttributeEncode(this String s)
		{
			if (!String.IsNullOrEmpty(s))
			{
				return Encoder.HtmlAttributeEncode(s);
			}
			return String.Empty;
		}

		#endregion

		#region public static string JavaScriptEncode(this String s)

		/// <summary>
		/// Encodiert den String XSS-Sicher für die Verwendung in einem JavaScript
		/// (Microsoft Anti-Cross Site Scripting Library V1.5)
		/// </summary>
		/// <param name="s">this</param>
		/// <returns>XSS-Sicheren encodierten String</returns>
		public static string JavaScriptEncode(this String s)
		{
			if (!String.IsNullOrEmpty(s))
			{
				return Encoder.JavaScriptEncode(s);
			}
			return String.Empty;
		}

		#endregion

		#region public static string UrlEncode(this String s)

		/// <summary>
		/// Encodiert den String XSS-Sicher für die Verwendung in einer URL
		/// (Microsoft Anti-Cross Site Scripting Library V1.5)
		/// </summary>
		/// <param name="s">this</param>
		/// <returns>XSS-Sicheren encodierten String</returns>
		public static string UrlEncode(this String s)
		{
			if (!String.IsNullOrEmpty(s))
			{
				return Encoder.UrlEncode(s);
			}
			return String.Empty;
		}

		#endregion

		#region public static string VisualBasicScriptEncode(this String s)

		/// <summary>
		/// Encodiert den String XSS-Sicher für die Verwendung in VisualBasic Script-Code
		/// (Microsoft Anti-Cross Site Scripting Library V1.5)
		/// </summary>
		/// <param name="s">this</param>
		/// <returns>XSS-Sicheren encodierten String</returns>
		public static string VisualBasicScriptEncode(this String s)
		{
			if (!String.IsNullOrEmpty(s))
			{
				return Encoder.VisualBasicScriptEncode(s);
			}
			return String.Empty;
		}

		#endregion

		#region public static string XmlEncode(this String s)

		/// <summary>
		/// Encodiert den String XSS-Sicher für die Verwendung in XML-Tags
		/// (Microsoft Anti-Cross Site Scripting Library V1.5)
		/// </summary>
		/// <param name="s">this</param>
		/// <returns>XSS-Sicheren encodierten String</returns>
		public static string XmlEncode(this String s)
		{
			if (!String.IsNullOrEmpty(s))
			{
				return Encoder.XmlEncode(s);
			}
			return String.Empty;
		}

		#endregion

		#region public static string XmlAttributeEncode(this String s)

		/// <summary>
		/// Encodiert den String XSS-Sicher für die Verwendung in XML-Attributen
		/// (Microsoft Anti-Cross Site Scripting Library V1.5)
		/// </summary>
		/// <param name="s">this</param>
		/// <returns>XSS-Sicheren encodierten String</returns>
		public static string XmlAttributeEncode(this String s)
		{
			if (!String.IsNullOrEmpty(s))
			{
				return Encoder.XmlAttributeEncode(s);
			}
			return String.Empty;
		}

		#endregion

		/// <summary>
		/// Extensionmethod to return only the alphanumeric part of a given string to remove js/html fragements or any other
		/// possibly bad input. Uses Regex "[^a-zA-Z0-9 _-]"
		/// </summary>
		/// <param name="str">String In</param>
		/// <returns>Sanitized string</returns>
		public static string AlphanumericOnly(this string str)
		{
			var rgx = new Regex("[^a-zA-Z0-9 _-]");
			return rgx.Replace(str, "");
		}

		/// <summary>
		/// Extensionmethod to return only the numeric part of a given string. Uses Regex "[^\D]"
		/// </summary>
		/// <param name="str">String In</param>
		/// <returns>Sanitized string</returns>
		public static string NumericOnly(this string str)
		{
			var rgx = new Regex("[^\\d]");
			return rgx.Replace(str, "");
		}
	}
}
