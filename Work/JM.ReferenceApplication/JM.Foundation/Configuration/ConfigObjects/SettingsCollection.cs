using System.Collections.Generic;
using System.Configuration;

namespace JM.Foundation.Configuration
{
    internal class SettingsCollection : ConfigurationElementCollection, IEnumerable<Setting>
    {
        public Setting this[int index]
        {
            get
            {
                return BaseGet(index) as Setting;
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

        public new IEnumerator<Setting> GetEnumerator()
        {
            int count = Count;

            for (int i = 0; i < count; i++)
            {
                yield return BaseGet(i) as Setting;
            }
        }

        protected override object GetElementKey(ConfigurationElement element)
        {
            return ((Setting)element).ID;
        }

        protected override ConfigurationElement CreateNewElement()
        {
            return new Setting();
        }
    }
}