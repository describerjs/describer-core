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
        Stream dbCreationTemplate;
        Stream dbContent;

        public FrmPrepareEnvironments()
        {
            InitializeComponent();

            this.dbViewModelDataGridView.CellDoubleClick += dbViewModelDataGridView_CellDoubleClick;
        }

        public FrmPrepareEnvironments(
            Stream dbCreationTemplate,
            Stream dbContent) : this()
        {
            this.dbCreationTemplate = dbCreationTemplate;
            this.dbContent = dbContent;
        }

        void dbViewModelDataGridView_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == this.CreateDBColumn.Index)
            {
                var dbModel = this.dbViewModelDataGridView.Rows[e.RowIndex].DataBoundItem as DbViewModel;
                if (dbModel != null && dbModel.Model != null)
                {
                    CreateDatabase(dbModel.Model);
                }
            }
        }

        private void CreateDatabase(SqlConnectionStringBuilder cnb)
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
                string script;

                using (var reader = new StreamReader(this.dbContent))
                {
                    script = reader.ReadToEnd();

                    IEnumerable<string> commandStrings = Regex.Split(script, @"^\s*GO\s*$",
                        RegexOptions.Multiline | RegexOptions.IgnoreCase);

                    foreach (var cstring in commandStrings.Where(c => !string.IsNullOrWhiteSpace(c)))
                    {
                        new SqlCommand(cstring, conn).ExecuteNonQuery();
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
