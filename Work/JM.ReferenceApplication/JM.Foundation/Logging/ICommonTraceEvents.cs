using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.Tracing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation.Logging
{
    //public interface

    interface ICommonTraceEvents
    {
        void OnError(
            Exception ex,
            string category,
            System.Diagnostics.TraceEventType severity,
            params object[] @params);
    }

    [EventSource(Name = "JM.Foundation.EventSource")]
    public class CommonTraceEvents : EventSource, ICommonTraceEvents
    {
        private CommonTraceEvents()
        {

        }

        //public class Keywords
        //{
        //    public const EventKeywords Page = (EventKeywords)1;
        //    public const EventKeywords DataBase = (EventKeywords)2;
        //    public const EventKeywords Diagnostic = (EventKeywords)4;
        //    public const EventKeywords Perf = (EventKeywords)8;
        //}

        public void OnError(Exception ex, string category, TraceEventType severity, params object[] @params)
        {
            
        }
        [Event(123)]
        public void OnCriticalError(string errMessage, string category)
        {
            base.WriteEvent(123, errMessage, category);
        }

        public static readonly CommonTraceEvents Log = new CommonTraceEvents();
    }
}
