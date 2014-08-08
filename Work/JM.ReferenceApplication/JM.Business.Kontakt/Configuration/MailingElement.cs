using System;
using System.Configuration;

namespace JM.Business.Kontakt.Configuration
{
    internal class MailingElement : ConfigurationElement
    {
        [ConfigurationProperty("recipientAdress", DefaultValue = "sve@joinmedia.de", IsRequired = true)]
        public string RecipientAdress
        {
            get { return this["recipientAdress"] as string; }
        }

        [ConfigurationProperty("defaultSubject", DefaultValue = "Kontakt Mail", IsRequired = true)]
        public string DefaultSubject
        {
            get { return this["defaultSubject"] as string; }
        }

        [ConfigurationProperty("subjectPrefix", IsRequired = false)]
        public string SubjectPrefix
        {
            get { return this["subjectPrefix"] as string; }
        }

        [ConfigurationProperty("sendAsHighPriorityMail", IsRequired = false)]
        public bool SendAsHighPriorityMail
        {
            get { return (bool)this["sendAsHighPriorityMail"]; }
        }
    }
}