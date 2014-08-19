using System;
using System.Diagnostics.Contracts;
using System.Web.Mvc;

namespace JM.Foundation.DependencyInjection
{
    public class AbstractModelBinder : DefaultModelBinder
    {
	    private readonly IDependencyResolver _resolver;

        public AbstractModelBinder(IDependencyResolver resolver)
        {
            Contract.Requires(resolver != null);
            _resolver = resolver;
        }

        protected override object CreateModel(ControllerContext controllerContext, ModelBindingContext bindingContext, Type modelType)
        {
            if (!MustResolve(bindingContext.ModelType))
            {
                return base.CreateModel(controllerContext, bindingContext, modelType);
            }

	        var resolvedObject =
		        _resolver.GetService(bindingContext.ModelType);

            if (resolvedObject != null)
            {
                return resolvedObject;
            }

	        throw TypeNotResolvable(bindingContext);
        }

        private static Exception TypeNotResolvable(ModelBindingContext bindingContext)
        {
            string message =
                string.Format(
                    "Konnte den Typ '{0}' nicht auflösen",
                    bindingContext.ModelType.ToString());

            return new InvalidOperationException(message);
        }

        private static bool MustResolve(Type type)
        {
            return
                !type.IsPrimitive &&
                (type.IsInterface ||
                type.IsAbstract ||
                HasNoParameterlessConstructor(type));
        }

        private static bool HasNoParameterlessConstructor(Type type)
        {
            return
                type.GetConstructor(Type.EmptyTypes) == null;
        }

        [ContractInvariantMethod]
        private void ObjectInvariant()
        {
            Contract.Invariant(_resolver != null);
        }
    }
}