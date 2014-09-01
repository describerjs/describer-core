using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.BaseSolutionWizard
{
    public class EnvironmentViewModel : INotifyPropertyChanged
    {
        private string adminConnectionString = string.Empty;
        private string standardConnectionString = string.Empty;
        private string environmentName = string.Empty;
        private bool isLocal = false;

        public bool IsDebug
        {
            get
            {
                return isLocal;
            }
            set
            {
                if (value != this.isLocal)
                {
                    OnPropertyChanged("IsLocal");
                }

                isLocal = value;
            }
        }

        public string EnvironmentName
        {
            get
            {
                return environmentName;
            }
            set
            {
                if (value != this.environmentName)
                {
                    OnPropertyChanged("EnvironmentName");
                }

                environmentName = value;
            }
        }

        public string AdminConnectionString
        {
            get
            {
                return adminConnectionString;
            }
            set
            {
                if(value != this.adminConnectionString)
                {
                    OnPropertyChanged("AdminConnectionString");
                }

                adminConnectionString = value;
            }
        }

        public string StandardConnectionString
        {
            get
            {
                return standardConnectionString;
            }
            set
            {
                if (value != this.standardConnectionString)
                {
                    OnPropertyChanged("StandardConnectionString");
                }

                standardConnectionString = value;
            }
        }

        private void OnPropertyChanged(string propName)
        {
            this.PropertyChanged(this, new PropertyChangedEventArgs(propName));
        }

        //public string RelativeConfigTranformFilePath
        //{
        //    get
        //    {
        //        return Path.Combine(EnvironmentName, )
        //    }
        //}

        public event PropertyChangedEventHandler PropertyChanged = delegate { };
    }
}