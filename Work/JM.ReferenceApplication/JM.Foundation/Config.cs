using System;
using System.Configuration;

namespace JM.Foundation
{
	internal class Config : ConfigurationSection
	{
		[ConfigurationProperty("ErrorHttpModule")]
		public ErrorHttpModule ErrorHttpModule
		{
			get
			{
				return (ErrorHttpModule)this["ErrorHttpModule"];
			}
		}

		[ConfigurationProperty("JMBasicAuthenticationFilter")]
		public JMBasicAuthenticationFilter JMBasicAuthenticationFilter
		{
			get
			{
				return (JMBasicAuthenticationFilter)this["JMBasicAuthenticationFilter"];
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
}
