using Mustache;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Forms;

namespace JM.BaseSolutionWizard
{
    public partial class FrmPrepareEnvironments : Form
    {
        Stream dbCreationTemplate;

        public FrmPrepareEnvironments()
        {
            InitializeComponent();

            this.dbViewModelDataGridView.CellDoubleClick += dbViewModelDataGridView_CellDoubleClick;
        }

        public FrmPrepareEnvironments(Stream dbCreationTemplate) : this()
        {
            this.dbCreationTemplate = dbCreationTemplate;
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
