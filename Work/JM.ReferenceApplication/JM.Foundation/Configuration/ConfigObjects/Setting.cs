using System.Configuration;

namespace JM.Foundation.Configuration
{
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
        [System.Diagnostics.Contracts.ContractVerification(false)]
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
}