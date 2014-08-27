﻿using JM.BaseSolutionWizard;
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

        public Form1(string projectName) : this()
        {

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
            var folderRoot = Directory.GetCurrentDirectory();
            var environments = this.environments;

            FileRenderer renderer = new FileRenderer();
            renderer.RenderFiles(format, folderRoot, environments);

            var env = environments.First(en => en.IsLocal);

            var fileName = env.EnvironmentName + ".config";
            var folderName = Path.Combine(folderRoot, env.EnvironmentName);
            var path = Path.Combine(folderName, fileName);

            using(var doc = new Microsoft.Web.XmlTransform.XmlTransformableDocument())
            {
                doc.Load(@"..\..\Web.config");

                using (var transform = new Microsoft.Web.XmlTransform.XmlTransformation(path))
                {
                    if (transform.Apply(doc))
                    {
                        doc.Save(@"..\..\transformed.config");
                    }
                }
            }
        }
    }
}