using Microsoft.Diagnostics.Tracing;

namespace JM.ReferenceApplication.Common.Monitoring
{
    public partial class ApplicationEvents
    {
        [Event(100, Level = EventLevel.Informational)]
        public void UserSignedIn(string userName)
        {
            base.WriteEvent(100, userName);
        }

        [Event(101, Level = EventLevel.Informational)]
        public void UserSignedOut(string userName)
        {
            base.WriteEvent(101, userName);
        }

		/// <summary>
		/// MonitoringTask für Absenden des Kontaltformulars in JM.Business.Kontakt
		/// </summary>
		/// <param name="email">Emailadresse</param>
		/// <param name="firstname">Vorname</param>
		/// <param name="lastname">Nachname</param>
		[Event(103, Level = EventLevel.Informational)]
		public void ContactFormSent(string email, string firstname, string lastname)
		{
			base.WriteEvent(103, email, firstname, lastname);
		}
    }
}
