using JM.Foundation.Extensions;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics.Contracts;

namespace JM.Foundation.Configuration
{
    public class Server : ConfigurationElement
	{	
		/// <summary>
		/// Interner Host
		/// </summary>
        [ConfigurationProperty("internalHost", IsRequired = true)]
        public string InternalHost
        {
			get { return this["internalHost"] as string; }
        }

		/// <summary>
		/// Externer Host
		/// </summary>
		[ConfigurationProperty("externalHost", IsRequired = true)]
		public string ExternalHost
		{
			get { return this["externalHost"] as string; }
		}

		/// <summary>
		/// Hauptdomain f�r den Server, z.B. "www.google.de"
		/// </summary>
		[ConfigurationProperty("primaryDomain", IsRequired = true)]
		public string PrimaryDomain
		{
			get { return this["primaryDomain"] as string; }
		}
		
		/// <summary>
		/// Liste der g�ltigen Domains f�r den Server
		/// </summary>
        [ConfigurationProperty("domains", IsRequired = true)]
		public string Domains
		{
			get
			{
                return this["domains"] as string;
			}
		}

	    public IEnumerable<string> GetDomainList()
	    {
		    return Domains.Contains(",") ? Domains.ToList(',') : new List<string>();
	    }
    }
}