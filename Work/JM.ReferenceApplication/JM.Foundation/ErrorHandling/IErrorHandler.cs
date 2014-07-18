﻿using Castle.DynamicProxy;
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

        void Handle(
            Exception ex,
            IInvocation invocation);
    }

    public class ErrorHandler : IErrorHandler
    {
        public void Handle(Exception ex, ExceptionPolicy policy, ContextAttribute context)
        {
            //LogException(ex, context as dynamic);

            ////CommonTraceEvents.Log.OnCriticalError(ex.ToString(), context);

            //if (policy == ExceptionPolicy.LogAndReplace)
            //{
            //    // Testcode only
            //    throw new JMApplicationException("Fehler bei: " + context);
            //}
        }

        //private void LogException(Exception ex, ContextAttribute context)
        //{
        //    LogException
        //}

        private void LogException(Exception ex, SystemBoundaryAttribute context, object[] arguments)
        {
            if(context.Impact == BusinesImpact.High)
            {
                JMEventSourceBase.Log.FatalBusinessException(ex, context.BusinessContext, arguments);
            }
        }

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
            SystemBoundaryAttribute attribute = null;

            var methodAttribute =
                (SystemBoundaryAttribute)invocation
                .Method
                .GetCustomAttributes(typeof(SystemBoundaryAttribute), true)
                .FirstOrDefault();

            if (methodAttribute == null)
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
                // ToDo:
            }
        }
    }

}
