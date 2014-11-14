using System.Collections.Generic;
using System.Configuration;

namespace JM.Foundation.Configuration
{
    public class TemplateCollection : ConfigurationElementCollection, IEnumerable<Template>
    {
		public Template this[int index]
        {
            get
            {
				return BaseGet(index) as Template;
            }

            set
            {
                if (BaseGet(index) != null)
                {
                    BaseRemoveAt(index);
                }

                BaseAdd(index, value);
            }
        }

		public new IEnumerator<Template> GetEnumerator()
        {
            int count = Count;

            for (int i = 0; i < count; i++)
            {
				yield return BaseGet(i) as Template;
            }
        }

        protected override object GetElementKey(ConfigurationElement element)
        {
			return ((Template)element).ID;
        }

        protected override ConfigurationElement CreateNewElement()
        {
			return new Template();
        }
    }
}