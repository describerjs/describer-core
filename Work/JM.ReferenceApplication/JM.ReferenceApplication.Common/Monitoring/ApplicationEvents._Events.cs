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
    }
}
