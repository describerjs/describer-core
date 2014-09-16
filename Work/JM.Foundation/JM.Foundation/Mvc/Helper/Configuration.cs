using JM.Foundation.Configuration;
using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JM.Foundation.Mvc.Helper
{
    /// <summary>
    /// Dieser Helper bietet dem Frontend Zugriff auf die Konfiguration der Performanceeinstellungen und optionalen Features.
    /// Die entsprechenden Einstellungen werden in der JM.Foundation - web.config section gepflegt
    /// </summary>
    public static class Configuration
    {
        #region public methods
        
        /// <summary>
        /// Prüft ob das übergebene Css-Feature aktiviert ist
        /// </summary>
        /// <param name="helper">HtmlHelper</param>
        /// <param name="feature">Enum-Wert Feature</param>
        /// <returns>bool</returns>
        public static bool FeatureEnabled(this HtmlHelper helper, PerformanceFeature feature)
        {
            var setting = GetSetting((int)feature);

            return setting != null && setting.Value;
        }

        /// <summary>
        /// Liefert, ob im DEBUG-Mode
        /// </summary>
        public static bool IsDebug(this HtmlHelper helper)
        {
#if DEBUG
            return true;
#else
            return false;
#endif
        }
        
        #endregion

		/// <summary>
		/// Liest den aktuellen Key aus, der für das Caching der Main JS genutzt wird.
		/// Ist der Key leer wird ein neuer erzeugt und gespeichert.
		/// </summary>
		/// <returns>string Key</returns>
	    public static string GetFrontEndCacheKey()
	    {
		    var key = HttpContext.Current.Application["frontendcachekey"] as string;

            if (string.IsNullOrEmpty(key))
            {
                key = UpdateFrontEndCacheKey();
            }

		    return key;
	    }

		/// <summary>
		/// Erzeugt und speichert einen neuen Key für das Caching der Main JS.
		/// </summary>
		/// <returns>string Key</returns>
	    public static string UpdateFrontEndCacheKey()
	    {
		    var key = DateTime.Now.ToString("yyyyMMddhhmmss");
		    HttpContext.Current.Application["frontendcachekey"] = key;

		    return key;
	    }

        #region private methods

        /// <summary>
        /// Liest die Configurationsection für JM.Foundation und gibt das entsprechende Config-Objekt zurück
        /// </summary>
        /// <returns>Config</returns>
        private static Config GetConfig()
        {
            return ApplicationConfiguration.GetConfigSection<Config>("JM.Foundation");
        }

        /// <summary>
        /// Holt ein bestimmtes Setting anhand der ID
        /// </summary>
        /// <param name="id">Id des Settings</param>
        /// <returns>Setting</returns>
        private static Setting GetSetting(int id)
        {
            var config = GetConfig();
            
            return 
                (config.Features ?? Enumerable.Empty<Setting>())
                .FirstOrDefault(d => d.ID == id.ToString());
        }

        #endregion
    }
}
