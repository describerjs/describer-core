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
		private const string SESSIONKEY_FRONTEND_TEMPLATE = "jbs_template";
	    private const string SESSIONKEY_FRONTEND_CACHE = "jbs_frontendcachekey";

        #region public methods
        
        /// <summary>
        /// Prüft ob das übergebene Css-Feature aktiviert ist
        /// </summary>
        /// <param name="helper">HtmlHelper</param>
        /// <param name="feature">Enum-Wert Feature</param>
        /// <returns>bool</returns>
        public static bool FeatureEnabled(this HtmlHelper helper, PerformanceFeature feature)
        {
            var setting = getSetting((int)feature);

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
			var key = HttpContext.Current.Application[SESSIONKEY_FRONTEND_CACHE] as string;

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
			HttpContext.Current.Application[SESSIONKEY_FRONTEND_CACHE] = key;

		    return key;
	    }

		/// <summary>
		/// Prüft ob ein Template aktiviert ist
		/// </summary>
		/// <returns>bool</returns>
	    public static bool HasActiveTemplate()
		{
			return getTemplateFromSession() != null || ApplicationConfiguration.SiteConfig.Templates.Any(t => t.Active);
		}

		/// <summary>
		/// Speichert das gewählte Template (sofern vorhanden) in der Session. Ist id leer wird der Sessionkey gelöscht.
		/// Bei Anfragen auf die anderen Template-Methoden überschreibt dieser Wert die Einstellungen in der Config
		/// </summary>
		/// <param name="id"></param>
	    public static void SetActiveTemplateForSession(string id)
	    {
			if (String.IsNullOrEmpty(id))
			{
				HttpContext.Current.Session[SESSIONKEY_FRONTEND_TEMPLATE] = null;
				return;
			}

			var template = ApplicationConfiguration.SiteConfig.Templates.FirstOrDefault(t => t.ID == id);
			if (template == null)
				return;

			HttpContext.Current.Session[SESSIONKEY_FRONTEND_TEMPLATE] = id;
	    }

		/// <summary>
		/// Gibt die ID des Templates zurück, das für die Session gesetzt wurde.
		/// </summary>
		/// <returns></returns>
		public static string GetActiveTemplateFromSession()
		{
			var template = getTemplateFromSession();
			return template != null ? template.ID : String.Empty;
		}

		/// <summary>
		/// Gibt den Pfad zum aktiven Template-Ordner zurück
		/// Für das ermitteln von Pfaden von anderen Resourcen im Template-Order
		/// </summary>
		/// <returns>string path</returns>
		public static string GetActiveTemplatePath()
		{
			var template = getTemplateFromSession() ?? ApplicationConfiguration.SiteConfig.Templates.FirstOrDefault(t => t.Active);
			return template != null ? template.Path : "";
		}

		/// <summary>
		/// Gibt die ID des aktiven Template zurück
		/// </summary>
		/// <returns>string path</returns>
		public static string GetActiveTemplateID()
		{
			var template = getTemplateFromSession() ?? ApplicationConfiguration.SiteConfig.Templates.FirstOrDefault(t => t.Active);
			return template != null ? template.ID : "";
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
        private static Setting getSetting(int id)
        {
            var config = GetConfig();
            
            return 
                (config.Features ?? Enumerable.Empty<Setting>())
                .FirstOrDefault(d => d.ID == id.ToString());
        }

		/// <summary>
		/// Prüft ob Template in der Sessio gespeichert ist und gibt es zurück oder null
		/// </summary>
		/// <returns>Template</returns>
	    private static Template getTemplateFromSession()
	    {
		    var key = HttpContext.Current.Session[SESSIONKEY_FRONTEND_TEMPLATE] as string;
		    if (!string.IsNullOrEmpty(key))
		    {
				return ApplicationConfiguration.SiteConfig.Templates.FirstOrDefault(t => t.ID == key);
		    }
		    return null;
	    }

        #endregion
    }
}
