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
        [Event(100, Level = EventLevel.Informational)]
        public void UserSignedIn(string userName)
        {
            base.WriteEvent(100, userName);
        }

        [Event(101, Level = EventLevel.Informational)]
        public void UserSignedOut(string userName)
        {
            base.WriteEvent(101, userName);
        }
    }
}
