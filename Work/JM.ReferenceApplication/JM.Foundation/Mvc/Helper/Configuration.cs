﻿using JM.Foundation.Configuration;
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
        #region public methods
        
        /// <summary>
        /// Prüft ob das übergebene Css-Feature aktiviert ist
        /// </summary>
        /// <param name="helper">HtmlHelper</param>
        /// <param name="feature">Enum-Wert Feature</param>
        /// <returns>bool</returns>
        public static bool FeatureEnabled(this HtmlHelper helper, PerformanceFeature feature)
        {
            var setting = _getSetting((int)feature);

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
        /// Holt ein bestimmtes Setting anhand der ID
        /// </summary>
        /// <param name="id">Id des Settings</param>
        /// <returns>Setting</returns>
        private static Setting _getSetting(int id)
        {
            var config = _getConfig();
            
            return 
                (config.Features ?? Enumerable.Empty<Setting>())
                .FirstOrDefault(d => d.ID == id.ToString());
        }

        #endregion
    }
}
