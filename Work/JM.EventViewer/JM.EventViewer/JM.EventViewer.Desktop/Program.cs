using Microsoft.Diagnostics.Tracing.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Reactive.Linq;
using Microsoft.Diagnostics.Tracing;
using Microsoft.Diagnostics.Tracing.Session;
using System.Diagnostics;

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

            using (var userSession = new TraceEventSession("ObserveEventSource"))
            {
                var result = userSession.EnableProvider("MyEventSource3", TraceEventLevel.Always);               
                Task.Run(() => userSession.Source.Process());
                Form1 form = new Form1(userSession);
                Application.Run(form);
            }
        }
    }
}
