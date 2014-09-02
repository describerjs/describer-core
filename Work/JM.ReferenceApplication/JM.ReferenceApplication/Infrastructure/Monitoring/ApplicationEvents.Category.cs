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
        public class Tasks
        {
            public const EventTask CriticalBusinessTask = (EventTask)1;
            public const EventTask BusinessTask = (EventTask)2;
            public const EventTask GenericTask = (EventTask)3;
        }
    }
}
