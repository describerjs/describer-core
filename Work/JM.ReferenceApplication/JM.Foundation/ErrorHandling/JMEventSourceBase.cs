using Microsoft.Diagnostics.Tracing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

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
            GenericException(ex.Message, ex.ToString(), string.Empty);
        }

        [NonEvent]
        public void Exception(Exception ex, MethodInfo callContext, object[] arguments)
        {
            string message = string.Format("Fehler in '{0}'", callContext.Name);

            var parameters = arguments.Select(a => a != null ? a.ToString() : "'null'");
            var joinedParameters = string.Join(", ", parameters);
            GenericException(ex.Message, ex.ToString(), joinedParameters);
        }

        [NonEvent]
        public void Exception(Exception ex, object[] arguments)
        {
            var parameters = arguments.Select(a => a != null ? a.ToString() : "'null'");
            var joinedParameters = string.Join(", ", parameters);
            GenericException(ex.Message, ex.ToString(), joinedParameters);
        }

        [NonEvent]
        public void FatalBusinessException(Exception ex, string businessContext, object[] arguments)
        {
            var parameters = arguments.Select(a => a != null ? a.ToString() : "'null'");
            var joinedParameters = string.Join(", ", parameters);
            FatalBusinessException(ex.Message, ex.ToString(), businessContext, joinedParameters);
        }

        [NonEvent]
        public void BusinessException(Exception ex, string businessContext, object[] arguments)
        {
            var parameters = arguments.Select(a => a != null ? a.ToString() : "'null'");
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