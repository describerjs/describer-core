using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JM.BaseSolutionWizard
{
    public partial class FrmJMBaseWizard : Form
    {
        public FrmJMBaseWizard()
        {
            InitializeComponent();
            this.adminConnectionStringTextBox.Enabled = false;
            this.standardConnectionStringTextBox.Enabled = false;
            this.environmentNameTextBox.Enabled = false;
            this.environmentViewModelBindingSource.ListChanged += environmentViewModelBindingSource_ListChanged;
        }

        void environmentViewModelBindingSource_ListChanged(object sender, ListChangedEventArgs e)
        {
            if (this.environmentViewModelBindingSource.List.Count == 0)
            {
                this.adminConnectionStringTextBox.Enabled = false;
                this.standardConnectionStringTextBox.Enabled = false;
                this.environmentNameTextBox.Enabled = false;
            }
            else
            {
                this.adminConnectionStringTextBox.Enabled = true;
                this.standardConnectionStringTextBox.Enabled = true;
                this.environmentNameTextBox.Enabled = true;
            }
        }

        public IEnumerable<EnvironmentViewModel> Environments
        {
            get
            {
                var environments = environmentViewModelBindingSource
                    .OfType<EnvironmentViewModel>()
                    .Where(en => !string.IsNullOrWhiteSpace(en.EnvironmentName)).ToList();

                return environments;
            }
        }

        public void SetData(IEnumerable<EnvironmentViewModel> models)
        {
            environmentViewModelBindingSource.DataSource = models.ToList();
        }

        protected override void OnClosing(CancelEventArgs e)
        {
            base.OnClosing(e);
            this.Validate();
        }
    }
}