using System;
using System.Configuration;

namespace JM.Business.Kontakt
{
	/// <summary>
	/// Konfiguration für diese DLL. Diese Konfiguration wird in einer Custom-Section für die Web.Config gespeichert und kann im Code
	/// dann als stark typisiertes Objekt genutzt werden.
	/// </summary>
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

		[ConfigurationProperty("SmtpServer")]
		public SmtpServerElement SmtpServer
		{
			get
			{
				return (SmtpServerElement)this["SmtpServer"];
			}
		}

		[ConfigurationProperty("Mailing")]
		public MailingElement Mailing
		{
			get
			{
				return (MailingElement)this["Mailing"];
			}
		}

		[ConfigurationProperty("ConnectionString")]
		public ConnectionString ConnectionString
		{
			get
			{
				return (ConnectionString)this["ConnectionString"];
			}
		}
	}

	internal class ConnectionString : ConfigurationElement
	{
		[ConfigurationProperty("value", IsRequired = true)]
		public String Value
		{
			get { return this["value"] as string; }
		}
	}

	internal class MailingElement : ConfigurationElement
	{
		[ConfigurationProperty("recipientAdress", DefaultValue = "sve@joinmedia.de", IsRequired = true)]
		public String RecipientAdress
		{
			get { return this["recipientAdress"] as string; }
		}

		[ConfigurationProperty("defaultSubject", DefaultValue = "Kontakt Mail", IsRequired = true)]
		public String DefaultSubject
		{
			get { return this["defaultSubject"] as string; }
		}

		[ConfigurationProperty("subjectPrefix", IsRequired = false)]
		public String SubjectPrefix
		{
			get { return this["subjectPrefix"] as string; }
		}

		[ConfigurationProperty("sendAsHighPriorityMail", IsRequired = false)]
		public bool SendAsHighPriorityMail
		{
			get { return (bool)this["sendAsHighPriorityMail"]; }
		}
	}

	internal class SmtpServerElement : ConfigurationElement
	{
		[ConfigurationProperty("server", IsRequired = true)]
		public String Server
		{
			get { return this["server"] as string; }
		}
	}
}
