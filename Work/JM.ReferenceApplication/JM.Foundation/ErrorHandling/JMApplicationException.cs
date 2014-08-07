using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation
{
    public class JMApplicationException : Exception
    {
        public JMApplicationException()
        {
        }

        public JMApplicationException(string message) : base(message)
        {
        }

        public JMApplicationException(string message, Exception innerException) : base(message, innerException)
        {
        }

        public string UserMessage
        {
            get;
            set;
        }

        public string RedirectUrl
        {
            get;
            set;
        }

		public bool HasUserMessage  
        { 
            get 
            { 
                return !string.IsNullOrEmpty(UserMessage); 
            }
        }

		public bool HasRedirectUrl 
        { 
            get 
            { 
                return !string.IsNullOrEmpty(RedirectUrl); 
            } 
        }

        public bool IsLogged
        { 
            get; 
            set; 
        }
    }
}
