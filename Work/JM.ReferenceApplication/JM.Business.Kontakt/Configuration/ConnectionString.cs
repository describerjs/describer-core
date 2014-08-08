using System;
using System.Configuration;

namespace JM.Business.Kontakt.Configuration
{
    internal class ConnectionString : ConfigurationElement
    {
        [ConfigurationProperty("value", IsRequired = true)]
        public string Value
        {
            get { return this["value"] as string; }
        }
    }
}