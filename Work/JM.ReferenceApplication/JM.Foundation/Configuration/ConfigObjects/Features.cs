using System.Configuration;

namespace JM.Foundation.Configuration
{
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
}