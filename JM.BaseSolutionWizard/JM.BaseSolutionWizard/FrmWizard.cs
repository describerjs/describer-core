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
    public partial class FrmWizard : Form
    {
        IEnumerable<EnvironmentViewModel> environments = Enumerable.Empty<EnvironmentViewModel>();

        string projectName;
        string solutionRootPath;

        public FrmWizard()
        {
            InitializeComponent();
        }

        public FrmWizard(string projectName, string solutionRootPath) : this()
        {
            this.projectName = projectName;
            this.solutionRootPath = solutionRootPath;

            System.Data.SqlClient.SqlConnectionStringBuilder builder = new System.Data.SqlClient.SqlConnectionStringBuilder();
            builder.DataSource = @"webdb.dbserver.joinmedia.local\PROJEKTE";
            builder.InitialCatalog = projectName;
            builder.UserID = "sa";
            builder.Password = "Join#media960";
            builder.MultipleActiveResultSets = true;

            this.environments =
                new List<EnvironmentViewModel>
                {
                    new EnvironmentViewModel
                    {
                        AdminConnectionString = builder.ConnectionString,
                        EnvironmentName = "Dev",
                        IsLocal = true,
                        StandardConnectionString = builder.ConnectionString
                    }
                };
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
            var environments = this.environments;

            FileRenderer renderer = new FileRenderer();
            renderer.RenderFiles(format, this.solutionRootPath, environments);

            var localEnvironment = this.environments.Single(env => env.IsLocal);
            ApplyToWebconfig(localEnvironment);
        }

        private void ApplyToWebconfig(EnvironmentViewModel localEnvironment)
        {
            var fileName = localEnvironment.EnvironmentName + ".config";
            var transformationFile = Path.Combine(this.solutionRootPath, localEnvironment.EnvironmentName, fileName);
            var targetFile = Path.Combine(this.solutionRootPath, this.projectName, "Web", this.projectName + ".Web", "web.config");
            var tempFilename = Path.GetTempFileName();
            ApplyTransform(transformationFile, tempFilename, targetFile);

        }

        private static void ApplyTransform(string transformationFile, string targetFileName, string transformationSource)
        {
            using (var doc = new Microsoft.Web.XmlTransform.XmlTransformableDocument())
            {
                doc.Load(transformationSource);

                using (var transform = new Microsoft.Web.XmlTransform.XmlTransformation(transformationFile))
                {
                    if (transform.Apply(doc))
                    {
                        doc.Save(targetFileName);
                    }
                }
            }
        }

        public IEnumerable<EnvironmentViewModel> Environments
        {
            get { return this.environments ?? Enumerable.Empty<EnvironmentViewModel>(); }
            set { this.environments = value; }
        }
    }
}