using System.Collections.Generic;

namespace JM.Business.Kontakt.Contracts.Model
{
	public interface IStartModel
	{
		List<IContactRequest> ContactRequests { get; set; }

		IPersonalData PersonalData { get; set; }
	}
}