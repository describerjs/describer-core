using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation
{
    [Serializable]
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

        public JMApplicationException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
            this.IsLogged = info.GetBoolean("IsLogged");
            this.UserMessage = info.GetString("UserMessage");
            this.RedirectUrl = info.GetString("RedirectUrl");
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

        public override void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            base.GetObjectData(info, context);
            info.AddValue("IsLogged", this.IsLogged);
            info.AddValue("UserMessage", this.UserMessage);
            info.AddValue("RedirectUrl", this.RedirectUrl);
        }
    }
}