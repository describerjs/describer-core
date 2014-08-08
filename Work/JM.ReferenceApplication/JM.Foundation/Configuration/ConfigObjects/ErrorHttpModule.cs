using System;
using System.Configuration;

namespace JM.Foundation.Configuration
{
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
}