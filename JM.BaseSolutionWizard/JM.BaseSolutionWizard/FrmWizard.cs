﻿using JM.BaseSolutionWizard;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class FrmWizard : Form
    {
        IList<EnvironmentViewModel> environments = new List<EnvironmentViewModel>();

        string projectName;
        string solutionRootPath;
        private string transformationFileTemplate;
        private string dbCreationScriptTemplate;
        private string dbInitialDataScript;

        public FrmWizard()
        {
            InitializeComponent();
        }

        public FrmWizard(
            string projectName, 
            string solutionRootPath,
            string transformationFileTemplate,
            string dbCreationScriptTemplate, string dbInitialDataScript)
            : this()
        {
            this.projectName = projectName;
            this.solutionRootPath = solutionRootPath;
            this.transformationFileTemplate = transformationFileTemplate;
            this.dbCreationScriptTemplate = dbCreationScriptTemplate;
            this.dbInitialDataScript = dbInitialDataScript;

            var builder = new SqlConnectionStringBuilder
            {
                DataSource = @"webdb.dbserver.joinmedia.local\PROJEKTE",
                InitialCatalog = projectName,
                UserID = "sa",
                Password = "Join#media960",
                MultipleActiveResultSets = true
            };

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

        void wizard_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.environments = 
                ((FrmJMBaseWizard)sender)
                .Environments
                .Where(en => !string.IsNullOrWhiteSpace(en.EnvironmentName))
                .ToList();
        }

        private void button1_Click(object sender, EventArgs e)
        {
           var wizard = new FrmJMBaseWizard();
            wizard.FormClosed += wizard_FormClosed;
            wizard.SetData(this.environments);
            wizard.ShowDialog();
        }

        private void btnSaveEnvironemtns_Click(object sender, EventArgs e)
        {
            WriteEnvironments();

            var models = new List<DbViewModel>();

            foreach (var environment in this.environments)
            {
                models.Add(new DbViewModel(new SqlConnectionStringBuilder(environment.AdminConnectionString)));
                if (environment.AdminConnectionString != environment.StandardConnectionString)
                {
                    models.Add(new DbViewModel(new SqlConnectionStringBuilder(environment.StandardConnectionString), true));
                }
            }

            var frm = new FrmPrepareEnvironments(this.dbCreationScriptTemplate, this.dbInitialDataScript)
            {
                DataSource = models
            };

            frm.ShowDialog();
            this.Close();
        }

        private void WriteEnvironments()
        {
            var format = string.Empty;

            using (var reader = new StreamReader(this.transformationFileTemplate))
            {
                format = reader.ReadToEnd();
            }

            var environments = this.environments;

            var renderer = new FileRenderer();
            renderer.RenderFiles(format, Path.Combine(this.solutionRootPath, "Solution Files"), environments);

            var localEnvironment = this.environments.Single(env => env.IsLocal);
            ApplyToWebconfig(localEnvironment);
        }

        private void ApplyToWebconfig(EnvironmentViewModel localEnvironment)
        {
            var fileName = localEnvironment.EnvironmentName + ".config";
            var transformationFile = Path.Combine(this.solutionRootPath, "Solution Files", "Environments", localEnvironment.EnvironmentName, fileName);
            var targetFile = Path.Combine(this.solutionRootPath, this.projectName, "Web", this.projectName + ".Web", "web.config");
            var tempFilename = Path.GetTempFileName();
            ApplyTransform(transformationFile, tempFilename, targetFile);

            //todo: temp => target
            File.Copy(tempFilename, targetFile, true);
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
            set { this.environments = value.ToList(); }
        }
    }
}