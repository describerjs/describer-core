using System.Configuration;

namespace JM.Foundation.Configuration
{
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
}