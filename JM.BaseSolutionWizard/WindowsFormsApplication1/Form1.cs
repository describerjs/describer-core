using JM.BaseSolutionWizard;
using Microsoft.CSharp.RuntimeBinder;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
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
                        IsDebug = true,
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
            //var format = File.ReadAllText("Web.Debug.config.MTemplate");
            //var folderRoot = Directory.GetCurrentDirectory();
            //var environments = this.environments;

            //FileRenderer renderer = new FileRenderer();
            //renderer.RenderFiles(format, folderRoot, environments);

            //var env = environments.First(en => en.IsLocal);

            //var fileName = env.EnvironmentName + ".config";
            //var folderName = Path.Combine(folderRoot, env.EnvironmentName);
            //var transformationFile = Path.Combine(folderName, fileName);
            //var targetFileName = @"..\..\transformed.config";
            //var transformationSource = @"..\..\Web.config";

            //ApplyTransform(transformationFile, targetFileName, transformationSource);

            foreach (var item in environments)
            {
                var scriptFilePath = @"..\..\..\Templating\InitialData.sql";
                var script = File.ReadAllText(scriptFilePath);

                CreateDatabase(new SqlConnectionStringBuilder(item.AdminConnectionString));

                using (SqlConnection conn = new SqlConnection(item.AdminConnectionString))
                {
                    conn.Open();

                    IEnumerable<string> commandStrings = Regex.Split(script, @"^\s*GO\s*$",
                        RegexOptions.Multiline | RegexOptions.IgnoreCase);

                    foreach (var cstring in commandStrings.Where(c => !string.IsNullOrWhiteSpace(c)))
                    {
                        new SqlCommand(cstring, conn).ExecuteNonQuery();
                    }
                }
            }
        }

        private void CreateDatabase(SqlConnectionStringBuilder cnb)
        {
            SqlConnectionStringBuilder masterDBCs = new SqlConnectionStringBuilder();
            masterDBCs.DataSource = cnb.DataSource;
            masterDBCs.UserID = cnb.UserID;
            masterDBCs.Password = cnb.Password;
            masterDBCs.InitialCatalog = "MASTER";

            using (SqlConnection conn = new SqlConnection(masterDBCs.ConnectionString))
            {
                conn.Open();

                var sqlCreateDBQuery = " CREATE DATABASE " + cnb.InitialCatalog;

                SqlCommand myCommand = new SqlCommand(sqlCreateDBQuery, conn);
                myCommand.ExecuteNonQuery();
            }
        }

        //private void CreateDatabase(DatabaseParam DBParam)
        //{
        //    System.Data.SqlClient.SqlConnection tmpConn;
        //    string sqlCreateDBQuery;
        //    tmpConn = new SqlConnection();
        //    tmpConn.ConnectionString = "SERVER = " + DBParam.ServerName +
        //                         "; DATABASE = master; User ID = sa; Pwd = sa";
        //    sqlCreateDBQuery = " CREATE DATABASE "
        //                       + DBParam.DatabaseName
        //                       + " ON PRIMARY "
        //                       + " (NAME = " + DBParam.DataFileName + ", "
        //                       + " FILENAME = '" + DBParam.DataPathName + "', "
        //                       + " SIZE = 2MB,"
        //                       + " FILEGROWTH =" + DBParam.DataFileGrowth + ") "
        //                       + " LOG ON (NAME =" + DBParam.LogFileName + ", "
        //                       + " FILENAME = '" + DBParam.LogPathName + "', "
        //                       + " SIZE = 1MB, "
        //                       + " FILEGROWTH =" + DBParam.LogFileGrowth + ") ";
        //    SqlCommand myCommand = new SqlCommand(sqlCreateDBQuery, tmpConn);
        //    try
        //    {
        //        tmpConn.Open();
        //        MessageBox.Show(sqlCreateDBQuery);
        //        myCommand.ExecuteNonQuery();
        //        MessageBox.Show("Database has been created successfully!",
        //                          "Create Database", MessageBoxButtons.OK,
        //                                      MessageBoxIcon.Information);
        //    }
        //    catch (System.Exception ex)
        //    {
        //        MessageBox.Show(ex.ToString(), "Create Database",
        //                                    MessageBoxButtons.OK,
        //                             MessageBoxIcon.Information);
        //    }
        //    finally
        //    {
        //        tmpConn.Close();
        //    }
        //    return;
        //}

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
    }
}