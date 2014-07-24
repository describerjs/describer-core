using Autofac.Extras.DynamicProxy2;
using JM.Business.Kontakt.Business.Model;
using JM.Business.Kontakt.Contracts.Manager;
using JM.Business.Kontakt.Contracts.Model;
using JM.Foundation;
using JM.Foundation.Configuration;
using JM.Foundation.ErrorHandling;
using JM.ReferenceApplication.Common.Monitoring;
using System;
using System.Net.Mail;

namespace JM.Business.Kontakt.Business.Manager
{
	[SystemBoundary("CustomerCare", BusinesImpact.Low)]
	[Intercept(typeof(ErrorInterceptor))]
	public class KontaktManager : IKontaktManager
	{
		public IContactModel GetContactModel()
		{
			return new ContactModel();
		}
		
		public void SendContactMail(IContactModel model)
		{
			var config = ApplicationConfiguration.GetConfigSection<Config>("JM.Business.Kontakt");

			var mail = new MailMessage(model.Email, config.Mailing.RecipientAdress);

			mail.Subject = String.Format("{0}{1}", config.Mailing.SubjectPrefix,
				String.IsNullOrEmpty(model.Subject) ? config.Mailing.DefaultSubject : model.Subject);

			mail.Body = String.Format("Mail vom {0}{1}", DateTime.Now, Environment.NewLine);
			mail.Body += String.Format("Absender: {0} {1} {2} {3}{3}", model.Salutation, model.FirstName, model.LastName, Environment.NewLine);
			mail.Body += model.Message;

			if (config.Mailing.SendAsHighPriorityMail)
				mail.Priority = MailPriority.High;

			// Loggen des Aufrufs
			ApplicationEvents.Log.ContactFormSent(model.Email, model.FirstName, model.LastName);

			var sender = new SmtpClient(config.SmtpServer.Server);
			sender.Send(mail);
		}

		private void saveMail(ContactModel model)
		{
			
		}
	}
}