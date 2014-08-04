using Microsoft.Diagnostics.Tracing;
using Microsoft.Diagnostics.Tracing.Session;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var userSession = new TraceEventSession("ObserveEventSource"))
            {
                if (TraceEventSession.IsElevated() != true)
                {
                    Debug.Fail("Du hast nicht die erforderlichen Rechte, Real Time Events zu konsumieren.");
                    return;
                }

                // create a real time user mode session
                //var eventStream = userSession.Source.Dynamic.Observe(null);
                userSession.Source.AllEvents += Source_AllEvents;
                userSession.Source.UnhandledEvents += Source_UnhandledEvents;
                var isRealTime = userSession.Source.IsRealTime;
                //eventStream
                //    .Subscribe(e => Debug.WriteLine(e.ToString()));

                userSession.Source.Dynamic.AddCallbackForProviderEvent("MyEventSource3", "GenericError", delegate(TraceEvent data)
                {
                    Debug.WriteLine(data.ToString());
                });

                //userSession.Source.UnhandledEvents += delegate(TraceEvent data)
                //{
                //    Debug.WriteLine(data.ToString());
                //};
                //Application.Run(new Form1(eventStream));
                string input = null;

                var result = userSession.EnableProvider("MyEventSource3", TraceEventLevel.Always);
                Debug.WriteLine(result);
                userSession.Source.Process();
                while (true)
                {
                    input = Console.ReadLine();
                }
            }
        }

        static void Source_UnhandledEvents(TraceEvent obj)
        {
            Debug.WriteLine(obj.ToString());
        }

        static void Source_AllEvents(TraceEvent obj)
        {
            Debug.WriteLine(obj.ToString());
        }
    }
}
