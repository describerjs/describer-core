using System.Configuration;

namespace JM.Foundation
{
    internal class Css : ConfigurationElement
    {
        [ConfigurationProperty("enableThis", IsRequired = true, DefaultValue = false)]
        public bool EnableThis
        {
            get { return (bool)this["enableThis"]; }
        }
    }
}