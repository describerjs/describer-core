using JM.BaseSolutionWizard;
using Microsoft.CSharp.RuntimeBinder;
using Mustache;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        IEnumerable<EnvironmentViewModel> environments = Enumerable.Empty<EnvironmentViewModel>();

        public Form1()
        {
            InitializeComponent();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        void wizard_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.environments = 
                ((FrmJMBaseWizard)sender)
                .Environments
                .Where(en => !string.IsNullOrWhiteSpace(en.EnvironmentName));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            JM.BaseSolutionWizard.FrmJMBaseWizard wizard = new JM.BaseSolutionWizard.FrmJMBaseWizard();
            wizard.FormClosed += wizard_FormClosed;
            wizard.SetData(this.environments);
            wizard.ShowDialog();
        }

        private void btnSaveEnvironemtns_Click(object sender, EventArgs e)
        {
            var format = File.ReadAllText("Web.Debug.config.MTemplate");
            var folderRoot = Directory.GetCurrentDirectory();
            var environments = this.environments;
            RenderFiles(format, folderRoot, environments);
        }

        private static void RenderFiles(
            string format, 
            string folderRoot, 
            IEnumerable<EnvironmentViewModel> environments)
        {
            FormatCompiler compiler = new FormatCompiler();
            Generator generator = compiler.Compile(format);

            var fileSource =
                environments
                .Select(en =>
                    new
                    {
                        FileName = en.EnvironmentName + ".config",
                        FolderName = Path.Combine(folderRoot, en.EnvironmentName),
                        TemplateSource = new EnvironmentTemplateSource
                        {
                            DefaultConnectionString = en.StandardConnectionString,
                            PiranhaConnectionString = en.AdminConnectionString,
                            IsDebug = en.IsLocal
                        }
                    })
                .ToList();

            var notExistingEnvironmentFolders =
                fileSource
                .Select(d => d.FolderName)
                .Distinct()
                .Where(folderName => !Directory.Exists(folderName))
                .ToList();

            notExistingEnvironmentFolders.ForEach(folderName =>
                Directory.CreateDirectory(folderName));

            fileSource.ForEach(
                item =>
                {
                    string result = generator.Render(item.TemplateSource);
                    var filePath = Path.Combine(item.FolderName, item.FileName);
                    File.WriteAllText(filePath, result);
                });
        }
    }
}