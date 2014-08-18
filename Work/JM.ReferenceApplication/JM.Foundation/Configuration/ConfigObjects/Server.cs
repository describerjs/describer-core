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
		/// Hauptdomain für den Server, z.B. "www.google.de"
		/// </summary>
		[ConfigurationProperty("primaryDomain", IsRequired = true)]
		public string PrimaryDomain
		{
			get { return this["primaryDomain"] as string; }
		}
		
		/// <summary>
		/// Liste der gültigen Domains für den Server
		/// </summary>
        [ConfigurationProperty("domains", IsRequired = true)]
		public IEnumerable<string> Domains
		{
			get
			{
                Contract.Ensures(Contract.Result<IEnumerable<string>>() != null);
				
                return
                    (this["domains"] as string ?? string.Empty).ToList(',');
			}
		}
    }
}