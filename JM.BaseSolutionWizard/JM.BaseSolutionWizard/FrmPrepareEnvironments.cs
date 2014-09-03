﻿using System;
using Mustache;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Forms;
using System.Linq;
using System.Text.RegularExpressions;

namespace JM.BaseSolutionWizard
{
    public partial class FrmPrepareEnvironments : Form
    {
        string dbCreationTemplate;
        string dbContent;

        public FrmPrepareEnvironments()
        {
            InitializeComponent();

            this.dbViewModelDataGridView.CellDoubleClick += dbViewModelDataGridView_CellDoubleClick;
        }

        public FrmPrepareEnvironments(
            string dbCreationTemplate,
            string dbContent)
            : this()
        {
            this.dbCreationTemplate = dbCreationTemplate;
            this.dbContent = dbContent;
        }

        void dbViewModelDataGridView_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == this.CreateDBColumn.Index && e.RowIndex >= 0)
            {
                var dbModel = this.dbViewModelDataGridView.Rows[e.RowIndex].DataBoundItem as DbViewModel;
                if (dbModel != null && dbModel.Model != null)
                {
                    CreateDatabase(dbModel.Model, dbModel.IsStandardConnection);
                }
            }
        }

        private void CreateDatabase(SqlConnectionStringBuilder cnb, bool isStandardConnection)
        {
            var masterDBCs = new SqlConnectionStringBuilder
            {
                DataSource = cnb.DataSource,
                UserID = cnb.UserID,
                Password = cnb.Password,
                InitialCatalog = "MASTER"
            };

            var format = string.Empty;

            using (var reader = new StreamReader(this.dbCreationTemplate))
            {
                format = reader.ReadToEnd();
            }

            var compiler = new FormatCompiler();
            var generator = compiler.Compile(format);
            var sqlCreateDBQuery = generator.Render(cnb);

            using (var conn = new SqlConnection(masterDBCs.ConnectionString))
            {
                conn.Open();
                var myCommand = new SqlCommand(sqlCreateDBQuery, conn);
                myCommand.ExecuteNonQuery();
            }

            //Create Tables just for Piranha (Admin) DB
            if (!isStandardConnection)
            {
                using (var conn = new SqlConnection(cnb.ConnectionString))
                {
                    conn.Open();
                    string script;

                    using (var reader = new StreamReader(this.dbContent))
                    {
                        try
                        {
                            script = reader.ReadToEnd();

                            IEnumerable<string> commandStrings = Regex.Split(script, @"^\s*GO\s*$",
                                RegexOptions.Multiline | RegexOptions.IgnoreCase);

                            foreach (var cstring in commandStrings.Where(c => !string.IsNullOrWhiteSpace(c)))
                            {
                                new SqlCommand(cstring, conn).ExecuteNonQuery();
                            }
                        }
                        catch (SqlException e)
                        {
                            //todo: handeln (wenn's die Tabelle schon gibt!)
                        }
                    }
                }
            }
        }

        public object DataSource
        {
            get
            {
                return this.dbViewModelDataGridView.DataSource;
            }

            set
            {
                this.dbViewModelDataGridView.DataSource = value;
            }
        }


    }
}
