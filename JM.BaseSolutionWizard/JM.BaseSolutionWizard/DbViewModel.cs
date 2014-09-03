using System.ComponentModel;
using System.Data.SqlClient;

namespace JM.BaseSolutionWizard
{
    public class DbViewModel : INotifyPropertyChanged
    {
        private string _serverName;
        private readonly SqlConnectionStringBuilder _model;
        private bool _isCreated;
        private bool _isStandardConnection;
        private string _dBName;

        public DbViewModel(SqlConnectionStringBuilder builder)
        {
            _serverName = builder.DataSource;
            _dBName = builder.InitialCatalog;
            _model = builder;;
        }
        public DbViewModel(SqlConnectionStringBuilder builder, bool isStandardConnection) : this (builder)
        {
            _isStandardConnection = isStandardConnection;
        }

        public SqlConnectionStringBuilder Model
        {
            get
            {
                return _model;
            }
        }

        public string ServerName
        {
            get { return _serverName; }
            set 
            {
                if (value != this._serverName)
                {
                    _serverName = value;
                    OnPropertyChanged("ServerName");
                }
            }
        }

        public bool IsCreated
        {
            get { return _isCreated; }
            set
            {
                if (value != this._isCreated)
                {
                    _isCreated = value;
                    OnPropertyChanged("IsCreated");
                }
            }
        }

        public bool IsStandardConnection
        {
            get { return _isStandardConnection; }
            set
            {
                if (value != this._isStandardConnection)
                {
                    _isStandardConnection = value;
                    //OnPropertyChanged("IsStandardConnection");
                }
            }
        }

        public string DBName
        {
            get { return _dBName; }
            set
            {
                if (value != this._dBName)
                {
                    _dBName = value;
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
