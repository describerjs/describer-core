using Microsoft.Diagnostics.Tracing.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Reactive.Linq;
using Microsoft.Diagnostics.Tracing;
using Microsoft.Diagnostics.Tracing.Session;

namespace JM.EventViewer.Desktop
{
    static class Program
    {
        /// <summary>
        /// Der Haupteinstiegspunkt für die Anwendung.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            if (TraceEventSession.IsElevated() != true)
            {
                MessageBox.Show("Du hast nicht die erforderlichen Rechte, Real Time Events zu konsumieren.");
                return;
            }

            // create a real time user mode session
            using (var userSession = new TraceEventSession("ObserveEventSource"))
            {
                userSession.EnableProvider("MyEventSource1");
                var eventStream = userSession.Source.Dynamic.Observe(null);
                Application.Run(new Form1(eventStream));
            }
        }
    }
}
