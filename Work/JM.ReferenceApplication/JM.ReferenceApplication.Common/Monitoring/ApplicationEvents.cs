using JM.Foundation.ErrorHandling;
using Microsoft.Diagnostics.Tracing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace JM.ReferenceApplication.Common.Monitoring
{
    [EventSource(Name = "JM-ReferenceApplication")]
    public sealed partial class ApplicationEvents : JMEventSourceBase<ApplicationEvents>
    {
    }
}