using Microsoft.AspNet.Identity;
using System.Threading.Tasks;

namespace joinmedia
{
	public class EmailService : IIdentityMessageService
	{
		public Task SendAsync(IdentityMessage message)
		{
			// Hier den E-Mail-Dienst einfügen, um eine E-Mail-Nachricht zu senden.
			return Task.FromResult(0);
		}
	}
}