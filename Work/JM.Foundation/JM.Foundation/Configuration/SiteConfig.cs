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
	}
}
