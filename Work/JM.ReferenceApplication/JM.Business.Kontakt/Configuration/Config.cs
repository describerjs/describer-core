using System;
using System.Configuration;

namespace JM.Business.Kontakt.Configuration
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
}