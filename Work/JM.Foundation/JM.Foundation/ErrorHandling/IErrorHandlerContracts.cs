using Castle.DynamicProxy;
using System;
using System.Diagnostics.Contracts;

namespace JM.Foundation.ErrorHandling
{
    [ContractClassFor(typeof(IErrorHandler))]
    internal abstract class ErrorHandlerContracts : IErrorHandler
    {
        public void Handle(Exception ex, ExceptionPolicy policy, string context)
        {
            Contract.Requires(ex != null);
            throw new NotImplementedException();
        }

        public void Handle(Exception ex, IInvocation invocation)
        {
            Contract.Requires(ex != null);
            Contract.Requires(invocation != null);
            throw new NotImplementedException();
        }
    }
}