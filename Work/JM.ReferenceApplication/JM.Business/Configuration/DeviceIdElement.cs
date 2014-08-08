using System.Configuration;

namespace JM.Business.Configuration
{
    internal class DeviceIdElement : ConfigurationElement
    {
        [ConfigurationProperty("id", IsRequired = true)]
        public string Id
        {
            get { return this["id"] as string; }
        }

        [ConfigurationProperty("name", IsRequired = true)]
        public string Name
        {
            get { return this["name"] as string; }
        }

        [ConfigurationProperty("manufacturer", IsRequired = true)]
        public string Manufacturer
        {
            get { return this["manufacturer"] as string; }
        }
    }
}