namespace JM.Business.Kontakt.Contracts.Model
{
	public interface IFamilyModel
	{
		string UserID { get; set; }

		string FamilyName { get; set; }

		IPersonalData Father { get; set; }

		IPersonalData Mother { get; set; }
	}
}
