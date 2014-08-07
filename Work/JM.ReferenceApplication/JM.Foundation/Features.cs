using System.Configuration;

namespace JM.Foundation
{
    internal class Features : ConfigurationElement
    {
        [ConfigurationProperty("Css")]
        public Css Css
        {
            get
            {
                return (Css)this["Css"];
            }
        }

        [ConfigurationProperty("Javascript")]
        public Javascript Javascript
        {
            get
            {
                return (Javascript)this["Javascript"];
            }
        }
    }
}