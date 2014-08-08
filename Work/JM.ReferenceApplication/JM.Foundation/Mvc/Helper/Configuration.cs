using JM.Foundation.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace JM.Foundation.Mvc.Helper
{
	/// <summary>
	/// Dieser Helper bietet dem Frontend Zugriff auf die Konfiguration der Performanceeinstellungen und optionalen Features.
	/// Die entsprechenden Einstellungen werden in der JM.Foundation - web.config section gepflegt
	/// </summary>
	public static class Configuration
	{
		//////////////////////////////////////////////////////////////////////////////////////
		#region public methods
		
		/// <summary>
		/// Prüft ob das übergebene Css-Feature aktiviert ist
		/// </summary>
		/// <param name="helper">HtmlHelper</param>
		/// <param name="feature">Enum-Wert Feature</param>
		/// <returns>bool</returns>
		public static bool FeatureEnabled(this HtmlHelper helper, CssFeatures feature)
		{
			return _getSettingValue((int)feature);
		}

		/// <summary>
		/// Prüft ob das übergebene JS-Feature aktiviert ist
		/// </summary>
		/// <param name="helper">HtmlHelper</param>
		/// <param name="feature">Enum-Wert Feature</param>
		/// <returns>bool</returns>
		public static bool FeatureEnabled(this HtmlHelper helper, JSFeatures feature)
		{
			return _getSettingValue((int)feature);
		}

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region private methods

		/// <summary>
		/// Liest die Configurationsection für JM.Foundation und gibt das entsprechende Config-Objekt zurück
		/// </summary>
		/// <returns>Config</returns>
		private static Config _getConfig()
		{
			return ApplicationConfiguration.GetConfigSection<Config>("JM.Foundation");
		}

		/// <summary>
		/// Holt den Wert eines bestimmten Settings anhand der SettingID
		/// </summary>
		/// <param name="id">SettingID</param>
		/// <returns>bool</returns>
		private static bool _getSettingValue(int id)
		{
			var setting = _getSetting(id);
			
			return setting != null && setting.Value;
		}

		/// <summary>
		/// Holt ein bestimmtes Setting anhand der ID
		/// </summary>
		/// <param name="id">Id des Settings</param>
		/// <returns>Setting</returns>
		private static Setting _getSetting(int id)
		{
			var config = _getConfig();
			var settings = new List<Setting>();

			settings.AddRange(config.Features.Css.Accessibility.ToList());
			settings.AddRange(config.Features.Css.Performance.ToList());
			settings.AddRange(config.Features.Css.Responsive.ToList());
			settings.AddRange(config.Features.Css.UX.ToList());

			settings.AddRange(config.Features.Javascript.Accessibility.ToList());
			settings.AddRange(config.Features.Javascript.Performance.ToList());
			settings.AddRange(config.Features.Javascript.Responsive.ToList());
			settings.AddRange(config.Features.Javascript.UX.ToList());


			return settings.FirstOrDefault(d => d.ID == id.ToString());
		}

		#endregion
	}
}
