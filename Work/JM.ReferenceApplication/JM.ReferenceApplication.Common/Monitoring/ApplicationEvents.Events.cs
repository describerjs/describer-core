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
        [Event(10, Level = EventLevel.Informational)]
        public void ApplicationStartup()
        {
            base.WriteEvent(10);
        }
    }
}
