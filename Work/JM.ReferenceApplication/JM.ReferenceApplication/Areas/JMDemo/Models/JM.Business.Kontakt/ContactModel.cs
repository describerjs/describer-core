using System.ComponentModel.DataAnnotations;
using JM.Business.Kontakt.Contracts.Model;

namespace JM.ReferenceApplication.Areas.JMDemo.Models.JM.Business.Kontakt
{
    public class ContactModel : IContactModel
    {
        private IContactModelValidator contactModelValidator;

        public ContactModel(IContactModelValidator contactModelValidator)
        {
            this.contactModelValidator = contactModelValidator;
        }

        public string UserID { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie eine Anrede an")]
        [RegularExpression(@"^(Herr|Frau)$", ErrorMessage = "Bitte wählen Sie zwischen 'Herr' und 'Frau'")]
        public string Salutation { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie Ihren Vornamen an")]
        [MaxLength(50, ErrorMessage = "Der Vorname darf maximal 50 Zeichen enthalten")]
        public string FirstName { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie Ihren Nachnamen an")]
        [MaxLength(50, ErrorMessage = "Der Nachname darf maximal 50 Zeichen enthalten")]
        public string LastName { get; set; }

        public string Subject { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie Ihre Mitteilung ein")]
        [MaxLength(1000, ErrorMessage = "Ihre Mitteilung darf maximal 1000 Zeichen enthalten")]
        public string Message { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie Ihre Emailadresse an")]
        [EmailAddress(ErrorMessage = "Bitte geben Sie eine gültige Emailadresse an")]
        public string Email { get; set; }
    }
}