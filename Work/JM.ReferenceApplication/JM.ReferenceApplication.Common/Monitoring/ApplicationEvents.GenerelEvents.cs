using Microsoft.Diagnostics.Tracing;

namespace JM.ReferenceApplication.Common.Monitoring
{
    public partial class ApplicationEvents
    {
        [Event(10, Level = EventLevel.Informational)]
        public void ApplicationStartup()
        {
            if (IsEnabled())
            {
                WriteEvent(10);
            }
        }
    }
}
