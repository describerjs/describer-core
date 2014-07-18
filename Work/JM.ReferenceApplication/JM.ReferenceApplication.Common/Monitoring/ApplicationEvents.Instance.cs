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
    public sealed partial class ApplicationEvents : JMEventSourceBase
    {
        static ApplicationEvents applicationEventsInstance;

        public static new ApplicationEvents Log
        {
            get
            {
                LazyInitializer
                    .EnsureInitialized<ApplicationEvents>(
                        ref ApplicationEvents.applicationEventsInstance,
                        () => 
                            {
                                var result = new ApplicationEvents();
                                JMEventSourceBase.instance = result;
                                return result;
                            });

                return ApplicationEvents.applicationEventsInstance;
            }
        }
    }
}
