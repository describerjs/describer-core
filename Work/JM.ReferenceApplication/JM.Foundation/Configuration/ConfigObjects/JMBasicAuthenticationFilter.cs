using System;
using System.Configuration;

namespace JM.Foundation.Configuration
{
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
}