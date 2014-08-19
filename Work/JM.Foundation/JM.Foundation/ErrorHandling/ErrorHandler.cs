using Castle.DynamicProxy;
using System;
using System.Diagnostics.Contracts;
using System.Linq;

namespace JM.Foundation.ErrorHandling
{
    public class ErrorHandler : IErrorHandler
    {
        public void Handle(Exception ex, ExceptionPolicy policy, string context)
        {
            throw new NotImplementedException();
        }

        public void Handle(Exception ex, IInvocation invocation)
        {
            LogException(ex, invocation);

            throw new JM.Foundation.JMApplicationException(string.Empty, ex)
            {
                IsLogged = true
            };
        }

        private void LogException(Exception ex, IInvocation invocation)
        {
            Contract.Requires(ex != null);
            Contract.Requires(invocation != null);

            SystemBoundaryAttribute attribute = null;

            var methodAttribute =
            (SystemBoundaryAttribute)invocation
            .Method
            .GetCustomAttributes(typeof(SystemBoundaryAttribute), true)
            .FirstOrDefault();

            if (methodAttribute == null &&
            invocation.Method.DeclaringType != null)
            {
                attribute =
                (SystemBoundaryAttribute)invocation
                .Method
                .DeclaringType
                .GetCustomAttributes(typeof(SystemBoundaryAttribute), true)
                .FirstOrDefault();
            }

            if (attribute != null)
            {
                LogException(ex, attribute, invocation.Arguments);
            }
            else
            {
                LogException(ex, invocation);
            }
        }

        private void LogException(Exception ex, SystemBoundaryAttribute context, object[] arguments)
        {
            if (context.Impact == BusinesImpact.High)
            {
                JMEventSourceBase.Log.FatalBusinessException(ex, context.BusinessContext, arguments);
            }
        }

        private void LogException(Exception ex, object[] arguments)
        {
            JMEventSourceBase.Log.Exception(ex, arguments);
        }
    }
}