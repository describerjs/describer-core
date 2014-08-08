using System;
using System.ComponentModel.DataAnnotations;

namespace JM.Business.Kontakt.Contracts.Model
{
	public interface IPersonalData
	{
		[Required]
		int ID { get; set; }
		[Required]
		string UserID { get; set; }
		[Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie eine Anrede an")]
		[RegularExpression(@"^(Herr|Frau)$", ErrorMessage = "Bitte wählen Sie zwischen 'Herr' und 'Frau'")]
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
