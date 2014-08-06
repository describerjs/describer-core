using Autofac.Extras.DynamicProxy2;
using JM.Business.Kontakt.Business.Model;
using JM.Business.Kontakt.Contracts.Manager;
using JM.Business.Kontakt.Contracts.Model;
using JM.Business.Kontakt.DataAccess;
using JM.Business.Kontakt.DataModel;
using JM.Foundation;
using JM.Foundation.Configuration;
using JM.Foundation.ErrorHandling;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net.Mail;

namespace JM.Business.Kontakt.Business.Manager
{
	[SystemBoundary("CustomerCare", BusinesImpact.Low)]
	[Intercept(typeof(ErrorInterceptor))]
	public class KontaktManager : IKontaktManager
	{
		private Config _config;

		public KontaktManager()
		{
			_config = ApplicationConfiguration.GetConfigSection<Config>("JM.Business.Kontakt");
		}

		public IContactModel GetContactModel()
		{
			return new ContactModel();
		}

		public IStartModel GetStartModel(string userID = "")
		{
			var personalData = GetPersonalData(userID);
			var contactRequests = GetContactRequests(userID);
			var model = new StartModel
			{
				PersonalData = personalData,
				ContactRequests = contactRequests
			};

			return model;
		}

		public void SendContactMail(IContactModel model)
		{
			var mail = new MailMessage(model.Email, _config.Mailing.RecipientAdress);

			mail.Subject = String.Format("{0}{1}", _config.Mailing.SubjectPrefix,
				String.IsNullOrEmpty(model.Subject) ? _config.Mailing.DefaultSubject : model.Subject);

			mail.Body = String.Format("Mail vom {0}{1}", DateTime.Now, Environment.NewLine);
			mail.Body += String.Format("Absender: {0} {1} {2} {3}{3}", model.Salutation, model.FirstName, model.LastName, Environment.NewLine);
			mail.Body += model.Message;

			if (_config.Mailing.SendAsHighPriorityMail)
				mail.Priority = MailPriority.High;

			// Loggen des Aufrufs
			new ModuleEvents().ContactFormSent(model.Email, model.FirstName, model.LastName);

			var sender = new SmtpClient(_config.SmtpServer.Server);
			sender.Send(mail);

			saveContactRequest(model);
		}

		public IFamilyModel GetFamilyModel(string userID)
		{
			return new FamilyModel { UserID = userID, Father = new Model.PersonalData(), Mother = new Model.PersonalData() };
		}

		private void saveContactRequest(IContactModel model)
		{
			var entry = new ContactRequest
			{
				CreatedAt = DateTime.Now,
				Message = model.Message,
				Subject = model.Subject,
				UserID = model.UserID
			};

			using (var db = new Data(_config.ConnectionString.Value))
			{
				db.ContactRequest.Add(entry);
				db.SaveChanges();
			}
		}

		public IPersonalData GetPersonalData(string userID)
		{
			IPersonalData data = null;

			using (var db = new Data(_config.ConnectionString.Value))
			{
				data = db.CustomerData.FirstOrDefault(u => u.UserID == userID);
			}

			return data ?? (data = new Model.PersonalData { UserID = userID });
		}

		public List<IContactRequest> GetContactRequests(string userID)
		{
			IEnumerable<IContactRequest> data = new List<IContactRequest>();

			using (var db = new Data(_config.ConnectionString.Value))
			{
				data = db.ContactRequest.Where(u => u.UserID == userID).ToList();
			}

			return data.ToList();
		}

		public bool SavePersonalData(IPersonalData model)
		{
			var data = new JM.Business.Kontakt.DataModel.PersonalData
			{
				CreatedAt = model.CreatedAt,
				Email=model.Email,
				UserID = model.UserID,
				Salutation = model.Salutation,
				FirstName = model.FirstName,
				ID = model.ID,
				LastEditAt = model.LastEditAt,
				LastName = model.LastName,
				Mobile = model.Mobile,
				PostCode = model.PostCode
			};

			using (var db = new Data(_config.ConnectionString.Value))
			{
				if (data.ID == 0)
				{
					data.CreatedAt = DateTime.Now;
				}
				db.CustomerData.AddOrUpdate(data);
				db.SaveChanges();
			}

			return true;
		}
	}
}