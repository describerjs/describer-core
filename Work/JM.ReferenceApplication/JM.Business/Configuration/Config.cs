using System.Configuration;

namespace JM.Business.Configuration
{
    internal class Config : ConfigurationSection
    {
        [ConfigurationProperty("moduleName", IsRequired = true)]
        public string ModuleName
        {
            get { return this["moduleName"] as string; }
        }

        [ConfigurationProperty("moduleVersion", IsRequired = true)]
        public string ModuleVersion
        {
            get { return this["moduleVersion"] as string; }
        }

        [ConfigurationProperty("deviceList", IsRequired = false)]
        public DeviceIdCollection DeviceList
        {
            get { return this["deviceList"] as DeviceIdCollection; }
        }
    }
}
