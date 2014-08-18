using Castle.DynamicProxy;
using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation.ErrorHandling
{
    [ContractClass(typeof(ErrorHandlerContracts))]
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
}
