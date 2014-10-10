using System.Configuration;

namespace JM.Foundation.Configuration
{
    public class Template : ConfigurationElement
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

		[ConfigurationProperty("path", IsRequired = true)]
		public string Path
		{
			get { return this["path"] as string; }
		}

        [ConfigurationProperty("active", IsRequired = true)]
        [System.Diagnostics.Contracts.ContractVerification(false)]
        public bool Active
        {
            get { return (bool)this["active"]; }
        }
    }
}