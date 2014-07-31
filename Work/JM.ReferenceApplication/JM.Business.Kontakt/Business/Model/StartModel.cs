using JM.Business.Kontakt.Contracts.Model;
using System.Collections.Generic;

namespace JM.Business.Kontakt.Business.Model
{
	public class StartModel : IStartModel
	{
		private List<IContactRequest> _contactRequests;

		public List<IContactRequest> ContactRequests
		{
			get { return _contactRequests ?? (_contactRequests = new List<IContactRequest>()); }
			set { _contactRequests = value; }
		}

		public IPersonalData PersonalData { get; set; }
	}
}
