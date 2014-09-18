using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
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

            var frmWizard =
                new FrmWizard(
                    @"TestProject",
                    @"..\..\..\",
                    Path.Combine(@"..\..\..\Templating", "Web.config.MTemplate"),
                    Path.Combine(@"..\..\..\Templating", "DbCreateScript.MTemplate"),
                    Path.Combine(@"..\..\..\Templating", "InitialData.sql"));

            Application.Run(frmWizard);
        }
    }
}
