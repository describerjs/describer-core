using Microsoft.Diagnostics.Tracing;

namespace JM.ReferenceApplication.Common.Monitoring
{
    public partial class ApplicationEvents
    {
        public class Tasks
        {
            public const EventTask CriticalBusinessTask = (EventTask)1;
            public const EventTask BusinessTask = (EventTask)2;
            public const EventTask GenericTask = (EventTask)3;
        }
    }
}
