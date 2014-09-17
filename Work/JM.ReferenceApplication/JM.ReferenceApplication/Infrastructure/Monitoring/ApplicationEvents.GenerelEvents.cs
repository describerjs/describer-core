using Microsoft.Diagnostics.Tracing;
using System;

namespace JM.ReferenceApplication.Common.Monitoring
{
    public partial class ApplicationEvents
    {
        [Event(1, Level = EventLevel.Informational)]
        public void ApplicationStartup()
        {
            if (IsEnabled())
            {
                WriteEvent(1);
            }
        }

        [Event(2, Level = EventLevel.Informational)]
        public void ApplicationStopped()
        {
            if (IsEnabled())
            {
                WriteEvent(2);
            }
        }

        [Event(10000, Level = EventLevel.Informational, Opcode = EventOpcode.Start, Task = Tasks.RequestMonitoring)]
        public void BeginRequest(string queryString, string utcTimeStamp)
        {
            if (IsEnabled())
            {
                WriteEvent(10000, queryString, utcTimeStamp);
            }
        }

        [Event(10001, Level = EventLevel.Informational, Opcode = EventOpcode.Stop, Task = Tasks.RequestMonitoring)]
        public void EndRequest(string queryString, string utcTimeStamp, string duration)
        {
            if (IsEnabled())
            {
                WriteEvent(10001, queryString, utcTimeStamp, duration);
            }
        }

        ////[Event(10000, Level = EventLevel.Verbose)]
        ////public void BeginRequestVerbose(DateTime utcTimeStamp, string querryString)
        ////{
        ////    if (IsEnabled())
        ////    {
        ////        WriteEvent(10000);
        ////    }
        ////}
    }
}
