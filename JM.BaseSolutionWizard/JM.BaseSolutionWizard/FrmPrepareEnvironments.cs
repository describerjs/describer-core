using Mustache;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JM.BaseSolutionWizard
{
    public partial class FrmPrepareEnvironments : Form
    {
        Stream dbCreationTemplate;

        public FrmPrepareEnvironments()
        {
            InitializeComponent();

            this.dbViewModelDataGridView.CellClick += dbViewModelDataGridView_CellClick;
        }

        public FrmPrepareEnvironments(Stream dbCreationTemplate) : this()
        {
            this.dbCreationTemplate = dbCreationTemplate;
        }

        void dbViewModelDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == this.CreateDBColumn.Index)
            {
                CreateDatabase(((DbViewModel)this.dbViewModelDataGridView.Rows[e.RowIndex].DataBoundItem).Model);
            }
        }

        private void CreateDatabase(SqlConnectionStringBuilder cnb)
        {
            SqlConnectionStringBuilder masterDBCs = new SqlConnectionStringBuilder();
            masterDBCs.DataSource = cnb.DataSource;
            masterDBCs.UserID = cnb.UserID;
            masterDBCs.Password = cnb.Password;
            masterDBCs.InitialCatalog = "MASTER";

            var format = string.Empty;

            using (StreamReader reader = new StreamReader(this.dbCreationTemplate))
            {
                format = reader.ReadToEnd();
            }

            FormatCompiler compiler = new FormatCompiler();
            Generator generator = compiler.Compile(format);
            var sqlCreateDBQuery = generator.Render(cnb);

            using (SqlConnection conn = new SqlConnection(masterDBCs.ConnectionString))
            {
                conn.Open();
                SqlCommand myCommand = new SqlCommand(sqlCreateDBQuery, conn);
                myCommand.ExecuteNonQuery();
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
