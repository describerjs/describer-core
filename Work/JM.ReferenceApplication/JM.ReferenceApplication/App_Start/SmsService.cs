using Microsoft.AspNet.Identity;
using System.Threading.Tasks;

namespace JM.ReferenceApplication
{
    public class SmsService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // Hier den SMS-Dienst einfügen, um eine Textnachricht zu senden.
            return Task.FromResult(0);
        }
    }
}