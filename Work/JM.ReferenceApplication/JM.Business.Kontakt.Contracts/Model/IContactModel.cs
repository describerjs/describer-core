using System.ComponentModel.DataAnnotations;

namespace JM.Business.Kontakt.Contracts.Model
{
	public interface IContactModel
	{
		[Required]
		string UserID { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie eine Anrede an")]
		[RegularExpression(@"^(Herr|Frau)$", ErrorMessage = "Bitte wählen Sie zwischen 'Herr' und 'Frau'")]
		string Salutation { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie Ihren Vornamen an")]
		[MaxLength(50, ErrorMessage = "Der Vorname darf maximal 50 Zeichen enthalten")]
		string FirstName { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie Ihren Nachnamen an")]
		[MaxLength(50, ErrorMessage = "Der Nachname darf maximal 50 Zeichen enthalten")]
		string LastName { get; set; }

		string Subject { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie Ihre Mitteilung ein")]
		[MaxLength(1000, ErrorMessage = "Ihre Mitteilung darf maximal 1000 Zeichen enthalten")]
		string Message { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie Ihre Emailadresse an")]
		[EmailAddress(ErrorMessage = "Bitte geben Sie eine gültige Emailadresse an")]
		string Email { get; set; }
	}
}
