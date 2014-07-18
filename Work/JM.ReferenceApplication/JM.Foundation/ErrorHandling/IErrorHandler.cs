//using JM.Foundation.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation.ErrorHandling
{
    public enum ExceptionPolicy
    {
        LogAndWrap,
        LogAndReplace,
        LogOnly
    }

    public interface IErrorHandler
    {
        void Handle(
            Exception ex, 
            ExceptionPolicy policy,
            string context);
    }

    public class ErrorHandler : IErrorHandler
    {
        public void Handle(Exception ex, ExceptionPolicy policy, string context)
        {
            //CommonTraceEvents.Log.OnCriticalError(ex.ToString(), context);

            if (policy == ExceptionPolicy.LogAndReplace)
            {
                // Testcode only
                throw new JMApplicationException("Fehler bei: " + context);
            }
        }
    }

}
