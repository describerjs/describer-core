using System;
using System.Configuration;

namespace JM.Foundation.Configuration
{
	/// <summary>
	/// Konfiguration für JM.Foundation
	/// Stellt alle konfigurativen Eigenschaften für die Basisanwendung dar.
	/// </summary>
	internal class Config : ConfigurationSection
	{
		/// <summary>
		/// Konfiguration für das HttpModul, über das die Erzeugung der Fehlerseiten läuft
		/// </summary>
		[ConfigurationProperty("ErrorHttpModule")]
		public ErrorHttpModule ErrorHttpModule
		{
			get
			{
				return (ErrorHttpModule)this["ErrorHttpModule"];
			}
		}

		/// <summary>
		/// Konfiguration für den BASIC-Auth Filter, mit dem per Default die /JM* Areas geschützt sind
		/// </summary>
		[ConfigurationProperty("JMBasicAuthenticationFilter")]
		public JMBasicAuthenticationFilter JMBasicAuthenticationFilter
		{
			get
			{
				return (JMBasicAuthenticationFilter)this["JMBasicAuthenticationFilter"];
			}
		}

		/// <summary>
		/// Konfiguration für die verschiedenen optionalen Features und Performancesettings
		/// </summary>
		[ConfigurationProperty("Features")]
		public Features Features
		{
			get
			{
				return (Features)this["Features"];
			}
		}
	}
}
