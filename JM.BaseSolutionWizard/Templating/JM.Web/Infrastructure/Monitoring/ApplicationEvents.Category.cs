using Microsoft.Diagnostics.Tracing;

namespace $safeprojectname$.Common.Monitoring
{
    public partial class ApplicationEvents
    {
        public class Tasks
        {
            public const EventTask CriticalBusinessTask = (EventTask)1;
            public const EventTask BusinessTask = (EventTask)2;
            public const EventTask GenericTask = (EventTask)3;
            public const EventTask RequestMonitoring = (EventTask)4;
        }
    }
}
