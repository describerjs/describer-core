using Microsoft.Diagnostics.Tracing;
using System;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Reflection;

namespace JM.Foundation.ErrorHandling
{
    public abstract class JMEventSourceBase : EventSource
    {
        protected static JMEventSourceBase s_baseInstance = null;

        public static JMEventSourceBase Log
        {
            get
            {
                return JMEventSourceBase.s_baseInstance;
            }
        }

        [NonEvent]
        public void Exception(Exception ex)
        {
            Contract.Requires(ex != null);

            GenericException(ex.Message, ex.ToString(), string.Empty);
        }

        [NonEvent]
        public void Exception(Exception ex, MethodInfo callContext, object[] arguments)
        {
            Contract.Requires(callContext != null);
            Contract.Requires(ex != null);

            string message = string.Format("Fehler in '{0}'", callContext.Name);

            var parameters =
                (arguments ?? new object[] { })
                .Select(a => a != null ? a.ToString() : "'null'");

            var joinedParameters = string.Join(", ", parameters);
            GenericException(ex.Message, ex.ToString(), joinedParameters);
        }

        [NonEvent]
        public void Exception(Exception ex, object[] arguments)
        {
            Contract.Requires(ex != null);

            var parameters =
                (arguments ?? new object[] { })
                .Select(a => a != null ? a.ToString() : "'null'");

            var joinedParameters = string.Join(", ", parameters);
            GenericException(ex.Message, ex.ToString(), joinedParameters);
        }

        [NonEvent]
        public void FatalBusinessException(Exception ex, string businessContext, object[] arguments)
        {
            Contract.Requires(ex != null);

            var parameters = 
                (arguments ?? new object[] { })
                .Select(a => a != null ? a.ToString() : "'null'");

            var joinedParameters = string.Join(", ", parameters);
            FatalBusinessException(ex.Message, ex.ToString(), businessContext, joinedParameters);
        }

        [NonEvent]
        public void BusinessException(Exception ex, string businessContext, object[] arguments)
        {
            Contract.Requires(ex != null);

            var parameters =
                (arguments ?? new object[] { })
                .Select(a => a != null ? a.ToString() : "'null'");

            var joinedParameters = string.Join(", ", parameters);
            FatalBusinessException(ex.Message, ex.ToString(), businessContext, joinedParameters);
        }

        protected abstract void GenericException(
            string message,
            string details,
            string parameters);

        protected abstract void FatalBusinessException(
            string message,
            string details,
            string context,
            string parameters);

        protected abstract void BusinessException(
            string message,
            string details,
            string context,
            string parameters);
    }
}