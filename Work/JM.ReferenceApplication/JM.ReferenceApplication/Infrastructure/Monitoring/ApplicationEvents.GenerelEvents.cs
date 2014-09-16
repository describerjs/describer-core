using Microsoft.Diagnostics.Tracing;

namespace JM.ReferenceApplication.Common.Monitoring
{
    public partial class ApplicationEvents
    {
        [Event(1, Level = EventLevel.Informational)]
        public void ApplicationStartup()
        {
            if (IsEnabled())
            {
                WriteEvent(1);
            }
        }
    }
}
