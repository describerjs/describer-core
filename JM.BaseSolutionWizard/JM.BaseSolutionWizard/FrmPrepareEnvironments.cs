using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JM.BaseSolutionWizard
{
    public partial class FrmPrepareEnvironments : Form
    {
        public FrmPrepareEnvironments()
        {
            InitializeComponent();

            this.dbViewModelDataGridView.CellClick += dbViewModelDataGridView_CellClick;
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

            using (SqlConnection conn = new SqlConnection(masterDBCs.ConnectionString))
            {
                conn.Open();

                var sqlCreateDBQuery = " CREATE DATABASE " + cnb.InitialCatalog;

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
