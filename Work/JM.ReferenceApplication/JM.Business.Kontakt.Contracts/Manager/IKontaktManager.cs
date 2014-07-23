using JM.Business.Kontakt.Contracts.Model;

namespace JM.Business.Kontakt.Contracts.Manager
{
	public interface IKontaktManager
	{
		void SendContactMail(IContactModel model);
		IContactModel GetContactModel();
	}
}
