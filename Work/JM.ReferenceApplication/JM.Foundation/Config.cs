using System;
using System.Configuration;

namespace JM.Foundation
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

	#region Configuration für das ErrorHttpModule

	internal class ErrorHttpModule : ConfigurationElement
	{
		[ConfigurationProperty("enabled", DefaultValue = true, IsRequired = false)]
		public Boolean Enabled
		{
			get { return (bool)this["enabled"]; }
		}

		[ConfigurationProperty("errorPageController", IsRequired = true)]
		public String ErrorPageController
		{
			get { return this["errorPageController"] as string; }
		}

		[ConfigurationProperty("errorPageAction", IsRequired = true)]
		public String ErrorPageAction
		{
			get { return this["errorPageAction"] as string; }
		}

		[ConfigurationProperty("showErrorDetails", IsRequired = true)]
		public bool ShowErrorDetails
		{
			get { return (bool)this["showErrorDetails"]; }
		}
	}

	#endregion

	#region Configuration das JMBasicAuthFilterAttribute zur BASIC-Authentication von Actions

	internal class JMBasicAuthenticationFilter : ConfigurationElement
	{
		[ConfigurationProperty("areaname", DefaultValue = "Geschützer Bereich", IsRequired = false)]
		public String AreaName
		{
			get { return this["areaname"] as string; }
		}

		[ConfigurationProperty("username", IsRequired = true)]
		public String Username
		{
			get { return this["username"] as string; }
		}

		[ConfigurationProperty("password", IsRequired = true)]
		public String Password
		{
			get { return this["password"] as string; }
		}
	}

	#endregion

	#region Configuration von Performance und Features

	internal class Features : ConfigurationElement
	{
		[ConfigurationProperty("Css")]
		public Css Css
		{
			get
			{
				return (Css)this["Css"];
			}
		}

		[ConfigurationProperty("Javascript")]
		public Javascript Javascript
		{
			get
			{
				return (Javascript)this["Javascript"];
			}
		}
	}

	internal class Javascript : ConfigurationElement
	{
		[ConfigurationProperty("enableLocalStorage", IsRequired = true, DefaultValue = false)]
		public bool EnableLocalStorage
		{
			get { return (bool)this["enableLocalStorage"]; }
		}
	}

	internal class Css : ConfigurationElement
	{
		[ConfigurationProperty("enableThis", IsRequired = true, DefaultValue = false)]
		public bool enableThis
		{
			get { return (bool)this["enableThis"]; }
		}
	}

	#endregion
}
