using System;
using System.Configuration;

namespace JM.Foundation
{
	public class Config : ConfigurationSection
	{
		[ConfigurationProperty("ErrorHttpModule")]
		public ErrorHttpModule ErrorHttpModule
		{
			get
			{
				return (ErrorHttpModule)this["ErrorHttpModule"];
			}
		}
	}

	/// <summary>
	/// Configuration für das ErrorHttpModule 
	/// </summary>
	public class ErrorHttpModule : ConfigurationElement
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
}
