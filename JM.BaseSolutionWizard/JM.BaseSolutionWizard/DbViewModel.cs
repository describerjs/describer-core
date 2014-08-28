using System.ComponentModel;
using System.Data.SqlClient;

namespace JM.BaseSolutionWizard
{
    public class DbViewModel : INotifyPropertyChanged
    {
        public DbViewModel(SqlConnectionStringBuilder builder)
        {
            this.serverName = builder.DataSource;
            this.dBName = builder.InitialCatalog;
            this.model = builder;
        }

        public DbViewModel()
        {

        }

        private SqlConnectionStringBuilder model;
        public SqlConnectionStringBuilder Model
        {
            get
            {
                model.DataSource = ServerName;
                model.InitialCatalog = DBName;
                return model;
            }
        }

        string serverName;

        public string ServerName
        {
            get { return serverName; }
            set 
            {
                if (value != this.serverName)
                {
                    serverName = value;
                    OnPropertyChanged("ServerName");
                }
            }
        }
        bool isCreated;

        public bool IsCreated
        {
            get { return isCreated; }
            set
            {
                if (value != this.isCreated)
                {
                    isCreated = value;
                    OnPropertyChanged("IsCreated");
                }
            }
        }
        string dBName;

        public string DBName
        {
            get { return dBName; }
            set
            {
                if (value != this.dBName)
                {
                    dBName = value;
                    OnPropertyChanged("DBName");
                }
            }
        }

        void OnPropertyChanged(string propName)
        {
            this.PropertyChanged(this, new PropertyChangedEventArgs(propName));
        }

        public event PropertyChangedEventHandler PropertyChanged = delegate { };
    }
}
