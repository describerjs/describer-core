using System;

namespace JM.Business.Kontakt.Contracts.Model
{
	public interface IPersonalData
	{
		int ID { get; }
		string UserID { get; set; }
		string Salutation { get; set; }
		string FirstName { get; set; }
		string LastName { get; set; }
		string Email { get; set; }
		string PostCode { get; set; }
		string Mobile { get; set; }
		DateTime CreatedAt { get; set; }
		DateTime? LastEditAt { get; set; }
	}
}
