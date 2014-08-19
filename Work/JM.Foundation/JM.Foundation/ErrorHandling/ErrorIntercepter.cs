using Castle.DynamicProxy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation.ErrorHandling
{
    public class ErrorInterceptor : IInterceptor
    {
        private readonly IErrorHandler _handler;

        public ErrorInterceptor(IErrorHandler handler)
        {
            this._handler = handler;
        }

        public void Intercept(IInvocation invocation)
        {
            try
            {
                invocation.Proceed();
            }
            catch (Exception ex)
            {
                HandleInternal(ex, invocation);
            }
        }

        private void HandleInternal(Exception ex, IInvocation invocation)
        {
            this._handler.Handle(ex, invocation);
        }
    }
}
