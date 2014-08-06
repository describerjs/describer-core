using System;

namespace JM.Foundation
{
    public class JMApplicationException : Exception
    {
		public string UserMessage { get; set; }
		public string RedirectUrl { get; set; }
		public bool HasUserMessage  { get { return !String.IsNullOrEmpty(UserMessage); }}
		public bool HasRedirectUrl { get { return !String.IsNullOrEmpty(RedirectUrl); } }

        public bool IsLogged
        { get; set; }

        public JMApplicationException()
        {

        }

        public JMApplicationException(string message) : base(message)
        {

        }

        public JMApplicationException(string message, Exception innerException) : base(message, innerException)
        {

        }
    }
}
