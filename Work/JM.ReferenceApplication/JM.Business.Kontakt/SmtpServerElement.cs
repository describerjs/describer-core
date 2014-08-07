using System;
using System.Configuration;

namespace JM.Business.Kontakt
{
    internal class SmtpServerElement : ConfigurationElement
    {
        [ConfigurationProperty("server", IsRequired = true)]
        public string Server
        {
            get { return this["server"] as string; }
        }
    }
}