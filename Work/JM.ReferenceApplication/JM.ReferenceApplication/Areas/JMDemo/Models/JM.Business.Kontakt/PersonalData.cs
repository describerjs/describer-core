using JM.Business.Kontakt.Contracts.Model;
using System;

namespace JM.ReferenceApplication.Areas.JMDemo.Models.JM.Business.Kontakt
{
	public class PersonalData : IPersonalData
	{
		public int ID { get; set; }
		public string Salutation { get; set; }
		public string UserID { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Email { get; set; }
		public string PostCode { get; set; }
		public string Mobile { get; set; }
		public DateTime CreatedAt { get; set; }
		public DateTime? LastEditAt { get; set; }
	}
}