using JM.Business.Kontakt.Contracts.Model;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace JM.Business.Kontakt.Business.Model
{
	public class FamilyModel : IFamilyModel
	{
		[Required]
		public string UserID { get; set; }

		[DisplayName("Familienname")]
		[Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie einen Familiennamen an")]
		[RegularExpression(@"^[a-zA-Z]{5,20}$")]
		public string FamilyName { get; set; }

		[Required(ErrorMessage = "Bitte geben Sie alle Daten für Ihren Vater an")]
		public IPersonalData Father { get; set; }

		[Required(ErrorMessage = "Bitte geben Sie alle Daten für Ihre Mutter an")]
		public IPersonalData Mother { get; set; }
	}
}
