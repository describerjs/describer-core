using System;

namespace JM.Business.Kontakt.Contracts.Model
{
	public interface IContactRequest
	{
		int ID { get; set; }

		string UserID { get; set; }

		string Subject { get; set; }

		string Message { get; set; }

		DateTime CreatedAt { get; set; }
	}
}
