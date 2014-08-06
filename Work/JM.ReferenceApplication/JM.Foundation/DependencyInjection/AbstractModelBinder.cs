using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace JM.Foundation.DependencyInjection
{
    public class AbstractModelBinder : DefaultModelBinder
    {
        IDependencyResolver resolver;

        public AbstractModelBinder(IDependencyResolver resolver)
        {
            if (resolver == null)
            {
                throw new ArgumentNullException("resolver");
            }

            this.resolver = resolver;
        }

        protected override object CreateModel(ControllerContext controllerContext, ModelBindingContext bindingContext, Type modelType)
        {
            if (MustResolve(bindingContext.ModelType))
            {
                var resolvedObject = 
                    this.resolver.GetService(bindingContext.ModelType);

                if (resolvedObject != null)
                {
                    return resolvedObject;
                }
                else
                {
                    throw TypeNotResolvable(bindingContext);
                }
            }

            return base.CreateModel(controllerContext, bindingContext, modelType);
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
    }
}