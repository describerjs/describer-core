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
        [Event(1, Level = EventLevel.Error, Task = Tasks.CriticalBusinessTask)]
        protected override void FatalBusinessException(
            string message, 
            string details, 
            string context, 
            string parameters)
        {
            base.WriteEvent(1, context, message, details, parameters);
        }

        [Event(2, Level = EventLevel.Error)]
        protected override void GenericException(string message, string details, string parameters)
        {
            base.WriteEvent(2, message, details, parameters);
        }

        [Event(3, Level = EventLevel.Error)]
        protected override void BusinessException(
            string message,
            string details,
            string context,
            string parameters)
        {
            base.WriteEvent(3, message, details, parameters);
        }
    }
}
