using System.Configuration;

namespace JM.Business.Configuration
{
    internal class DeviceIdCollection : ConfigurationElementCollection
    {
        public DeviceIdElement this[int index]
        {
            get
            {
                return BaseGet(index) as DeviceIdElement;
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

        protected override object GetElementKey(ConfigurationElement element)
        {
            return ((DeviceIdElement)element).Id;
        }

        protected override ConfigurationElement CreateNewElement()
        {
            return new DeviceIdElement();
        }
    }
}