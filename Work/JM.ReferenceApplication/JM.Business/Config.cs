using System.Configuration;

namespace JM.Business
{
	internal class Config : ConfigurationSection
	{
		[ConfigurationProperty("moduleName", IsRequired = true)]
		public string ModuleName
		{
			get { return this["moduleName"] as string; }
		}

		[ConfigurationProperty("moduleVersion", IsRequired = true)]
		public string ModuleVersion
		{
			get { return this["moduleVersion"] as string; }
		}

		[ConfigurationProperty("deviceList", IsRequired = false)]
		public DeviceIdCollection DeviceList
		{
			get { return this["deviceList"] as DeviceIdCollection; }
		}
	}

	internal class DeviceIdElement : ConfigurationElement
	{
		[ConfigurationProperty("id", IsRequired = true)]
		public string Id
		{
			get { return this["id"] as string; }
		}

		[ConfigurationProperty("name", IsRequired = true)]
		public string Name
		{
			get { return this["name"] as string; }
		}

		[ConfigurationProperty("manufacturer", IsRequired = true)]
		public string Manufacturer
		{
			get { return this["manufacturer"] as string; }
		}
	}

	internal class DeviceIdCollection : ConfigurationElementCollection
	{
		public DeviceIdElement this[int index]
		{
			get { return BaseGet(index) as DeviceIdElement; }
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
