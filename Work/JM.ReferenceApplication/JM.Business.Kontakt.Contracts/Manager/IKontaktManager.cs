using JM.Business.Kontakt.Contracts.Model;
using System.Collections.Generic;

namespace JM.Business.Kontakt.Contracts.Manager
{
	public interface IKontaktManager
	{
		IContactModel GetContactModel();
		IStartModel GetStartModel(string userID = "");
		void SendContactMail(IContactModel model);
		IPersonalData GetPersonalData(string userID);
		List<IContactRequest> GetContactRequests(string userID);
		bool SavePersonalData(IPersonalData model);
		IFamilyModel GetFamilyModel(string userID);
	}
}
