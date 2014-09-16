using JM.Foundation.ErrorHandling;
using Microsoft.Diagnostics.Tracing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.ReferenceApplication.Common.Monitoring
{
    public partial class ApplicationEvents
    {
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
