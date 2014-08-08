using System.Web.Mvc;
using JM.Foundation.Configuration;

namespace JM.Foundation.Mvc.Helper
{
	/// <summary>
	/// Dieser Helper bietet dem Frontend Zugriff auf die Konfiguration der Performanceeinstellungen und optionalen Features.
	/// Die entsprechenden Einstellungen werden in der JM.Foundation - web.config section gepflegt
	/// </summary>
	public static class Configuration
	{
		public static bool LocalStorageEnabled(this HtmlHelper helper, string type = "")
		{
			return GetConfig().Features.Javascript.EnableLocalStorage;
		}

		/// <summary>
		/// Liest die Configurationsection für JM.Foundation und gibt das entsprechende Config-Objekt zurück
		/// </summary>
		/// <returns>Config</returns>
		private static Config GetConfig()
		{
			return ApplicationConfiguration.GetConfigSection<Config>("JM.Foundation");
		}
	}
}
