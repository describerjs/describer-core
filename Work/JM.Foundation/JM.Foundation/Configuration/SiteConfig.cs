using System.Configuration;

namespace JM.Foundation.Configuration
{
	/// <summary>
	/// Konfiguration für alle allgemeine / nicht modulspezifischen Einstellungen wie Server- und Domainsettings
	/// </summary>
	public class SiteConfig : ConfigurationSection
	{
		/// <summary>
		/// Einstellungen des Servers
		/// </summary>
		[ConfigurationProperty("Server")]
		public Server Server
		{
			get
			{
				return (Server)this["Server"];
			}
		}

		/// <summary>
		/// Konfiguration der verfügbaren Templates, und welches Template aktiv ist
		/// </summary>
		[ConfigurationProperty("Templates", IsRequired = true)]
		public TemplateCollection Templates
		{
			get { return this["Templates"] as TemplateCollection; }
		}
	}
}
