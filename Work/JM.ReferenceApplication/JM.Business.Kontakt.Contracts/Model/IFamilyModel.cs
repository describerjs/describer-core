using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace JM.Business.Kontakt.Contracts.Model
{
	public interface IFamilyModel
	{
		[Required]
		string UserID { get; set; }

		[DisplayName("Familienname")]
		[Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie einen Familiennamen an")]
		[RegularExpression(@"^(a-zA-Z){5,20}")]
		string FamilyName { get; set; }

		[Required(ErrorMessage = "Bitte geben Sie alle Daten für Ihren Vater an")]
		IPersonalData Father { get; set; }

		[Required(ErrorMessage = "Bitte geben Sie alle Daten für Ihre Mutter an")]
		IPersonalData Mother { get; set; }
	}
}
