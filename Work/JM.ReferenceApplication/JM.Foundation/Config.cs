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

	//////////////////////////////////////////////////////////////////////////////////////
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

	//////////////////////////////////////////////////////////////////////////////////////
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

	//////////////////////////////////////////////////////////////////////////////////////
	#region Configuration von Performance und Features

	internal class Features : ConfigurationElement
	{
		[ConfigurationProperty("css")]
		public Css Css
		{
			get
			{
				return (Css)this["css"];
			}
		}

		[ConfigurationProperty("javascript")]
		public Javascript Javascript
		{
			get
			{
				return (Javascript)this["javascript"];
			}
		}
	}

	internal class Javascript : ConfigurationElement
	{
		[ConfigurationProperty("responsive", IsRequired = true)]
		public SettingsCollection Responsive
		{
			get { return this["responsive"] as SettingsCollection; }
		}

		[ConfigurationProperty("performance", IsRequired = true)]
		public SettingsCollection Performance
		{
			get { return this["performance"] as SettingsCollection; }
		}

		[ConfigurationProperty("accessibility", IsRequired = true)]
		public SettingsCollection Accessibility
		{
			get { return this["accessibility"] as SettingsCollection; }
		}

		[ConfigurationProperty("ux", IsRequired = true)]
		public SettingsCollection UX
		{
			get { return this["ux"] as SettingsCollection; }
		}
	}

	internal class Css : ConfigurationElement
	{
		[ConfigurationProperty("responsive", IsRequired = true)]
		public SettingsCollection Responsive
		{
			get { return this["responsive"] as SettingsCollection; }
		}

		[ConfigurationProperty("performance", IsRequired = true)]
		public SettingsCollection Performance
		{
			get { return this["performance"] as SettingsCollection; }
		}

		[ConfigurationProperty("accessibility", IsRequired = true)]
		public SettingsCollection Accessibility
		{
			get { return this["accessibility"] as SettingsCollection; }
		}

		[ConfigurationProperty("ux", IsRequired = true)]
		public SettingsCollection UX
		{
			get { return this["ux"] as SettingsCollection; }
		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	#region Deklaration Collection und CollectionElement

	internal class SettingsCollection : ConfigurationElementCollection
	{
		public Setting this[int index]
		{
			get { return BaseGet(index) as Setting; }
			set
			{
				if (BaseGet(index) != null)
				{
					BaseRemoveAt(index);
				}
				BaseAdd(index, value);
			}
		}

		protected override object GetElementKey(ConfigurationElement element)
		{
			return ((Setting)element).ID;
		}

		protected override ConfigurationElement CreateNewElement()
		{
			return new Setting();
		}
	}

	internal class Setting : ConfigurationElement
	{
		[ConfigurationProperty("id", IsRequired = true)]
		public string ID
		{
			get { return this["id"] as string; }
		}

		[ConfigurationProperty("name", IsRequired = true)]
		public string Name
		{
			get { return this["name"] as string; }
		}

		[ConfigurationProperty("value", IsRequired = true)]
		public bool Value
		{
			get { return (bool)this["value"]; }
		}

		[ConfigurationProperty("description", IsRequired = true)]
		public string Description
		{
			get { return this["description"] as string; }
		}
	}
	#endregion

	#endregion
}
