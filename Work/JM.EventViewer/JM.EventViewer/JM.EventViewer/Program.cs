using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace JM.EventViewer
{
    class Program
    {
        static void Main(string[] args)
        {
            Microsoft.Practices.EnterpriseLibrary.SemanticLogging.ObservableEventListener l = new Microsoft.Practices.EnterpriseLibrary.SemanticLogging.ObservableEventListener();
            l.EnableEvents("MyEventSource1", System.Diagnostics.Tracing.EventLevel.LogAlways);
            l.Subscribe(ee => Debug.WriteLine(ee.ToString()));

            while (true)
            {

                Thread.Sleep(100);
            }
        }
    }
}
