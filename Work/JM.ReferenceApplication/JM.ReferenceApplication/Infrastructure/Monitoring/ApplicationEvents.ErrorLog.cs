using Microsoft.Diagnostics.Tracing;

namespace JM.ReferenceApplication.Common.Monitoring
{
    public partial class ApplicationEvents
    {
        [Event(104, Level = EventLevel.Error)]
        public void PiranhaError(
            string origin,
            string message)
        {
            if (IsEnabled())
            {
                WriteEvent(104, origin, message);
            }
        }

        [Event(105, Level = EventLevel.Error)]
        public void PiranhaException(
            string origin,
            string message,
            string exDetails)
        {
            if (IsEnabled())
            {
                WriteEvent(105, origin, message, exDetails);
            }
        }

        [Event(101, Level = EventLevel.Error, Task = Tasks.CriticalBusinessTask)]
        protected override void FatalBusinessException(
            string message,
            string details, 
            string context, 
            string parameters)
        {
            if (this.IsEnabled())
            {
                WriteEvent(101, context, message, details, parameters);
            }
        }

        [Event(102, Level = EventLevel.Error)]
        protected override void GenericException(string message, string details, string parameters)
        {
            if (IsEnabled())
            {
                WriteEvent(102, message, details, parameters);
            }
        }

        [Event(103, Level = EventLevel.Error)]
        protected override void BusinessException(
            string message,
            string details,
            string context,
            string parameters)
        {
            if (IsEnabled())
            {
                WriteEvent(103, message, details, parameters);
            }
        }
    }
}
