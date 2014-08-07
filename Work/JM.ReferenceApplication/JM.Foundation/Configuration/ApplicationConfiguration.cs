using System;
using System.Configuration;
using System.Diagnostics.Contracts;

namespace JM.Foundation.Configuration
{
	/// <summary>
	/// Bietet Zugang zu den verschiedenen Methoden, um Werte und Sections aus KonfigurationsDateien zu lesen
	/// </summary>
	public class ApplicationConfiguration
	{
		#region public methods

		/// <summary>
		/// Liest einen Wert aus der Konfigurationsdatei
		/// </summary>
		/// <param name="configurationKey"></param>
		/// <param name="defaultValue"></param>
		/// <returns>string Value</returns>
        public static string GetConfigurationValue(string configurationKey, string defaultValue)
        {
            var configurationValue = ConfigurationManager.AppSettings[configurationKey];

	        return string.IsNullOrEmpty(configurationValue) ? defaultValue : configurationValue;
        }

        // ToDo: Korrektheit prüfen
        /////// <summary>
        /////// Versucht einen Wert aus der Konfigurationsdatei zu lesen und diesen als den übergebenen EnumType zu casten
        /////// </summary>
        /////// <typeparam name="T"></typeparam>
        /////// <param name="configurationKey"></param>
        /////// <param name="defaultValue"></param>
        /////// <returns>Enum</returns>
        ////public static T GetEnum<T>(string configurationKey, T? defaultValue = null)
        ////    where T : struct
        ////{
        ////    var configurationValue = ConfigurationManager.AppSettings[configurationKey];

        ////    if (string.IsNullOrEmpty(configurationValue))
        ////    {
        ////        if (defaultValue == null)
        ////        {
        ////            throw new InvalidOperationException("required appSetting " + configurationKey + " is missing");
        ////        }
                    
        ////        return defaultValue.Value;
        ////    }

        ////    return (T)Enum.Parse(typeof(T), configurationKey, false);
        ////}

        /// <summary>
        /// Versucht eine <see cref="ConfigurationSection"/> aus der Konfigurationsdatei zu lesen.
        /// </summary>
        /// <typeparam name="T">Der Type des stark typisierte ConfigurationSection</typeparam>
        /// <param name="sectionName">Der Name der zu lesenden Sektion.</param>
        /// <param name="configSection">Im Erfolgsfall eine stark typisierte ConfigurationSection.</param>
        /// <returns><c>True</c>, wenn der Abschnitt erfolgreich gelesen werden konnte, ansonsten <c>False</c>.</returns>
        public static bool TryGetConfigSection<T>(string sectionName, out T configSection)
            where T : ConfigurationSection
        {
            configSection = null;
			T section = null;

			// In web.config sichen
			section = ConfigurationManager.GetSection(sectionName) as T;
			if (section != null)
			{
				configSection = section;
				return true;
			}

            ////// In app.config suchen
            ////var appConfig = getConfigurationFromAppConfig();

            ////if (appConfig != null)
            ////{
            ////	section = appConfig.GetSection(sectionName) as T;

            ////	if (section != null)
            ////	{
            ////		configSection = section;
            ////		return true;
            ////	}
            ////}

            return false;
        }

		/// <summary>
		/// Liest eine <see cref="ConfigurationSection"/> aus der Konfigurationsdatei oder feuert bei Misserfolg eine Exception.
		/// </summary>
		/// <typeparam name="T">Der Type des stark typisierte ConfigurationSection</typeparam>
		/// <param name="sectionName">Der Name der zu lesenden Sektion.</param>
		/// <returns></returns>
		public static T GetConfigSection<T>(string sectionName)
			where T : ConfigurationSection
		{
            Contract.Ensures(Contract.Result<T>() != null);

			var configSection = ConfigurationManager.GetSection(sectionName) as T;

            if (configSection != null)
            {
                return configSection;
            }

			throw
				new JMApplicationException(
					string.Format("Die angegebene ConfigurationSection '{0}' konnte nicht geladen werden", sectionName));
		}

		#endregion

		#region private methods

		private System.Configuration.Configuration GetConfigurationFromAppConfig()
		{
			return ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
		}

		#endregion
	}
}
