using JM.Foundation.Extensions;
using System.Collections.Generic;
using System.Configuration;

namespace JM.Foundation.Configuration
{
    public class Server : ConfigurationElement
	{
		#region private vars
	
		/// <summary>
		/// private Version der Domains-Eigenschaft
		/// </summary>
		[ConfigurationProperty("domains", IsRequired = true)]
		private string _domains
		{
			get
			{
				return this["domains"] as string;
			}
		}

		#endregion

		/// <summary>
		/// Servertype: DEV, ANSICHT, LIVE
		/// </summary>
        [ConfigurationProperty("serverTyp", IsRequired = true)]
        public string ServerTyp
        {
            get { return this["serverTyp"] as string; }
        }
		
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
		public IEnumerable<string> Domains
		{
			get
			{
				return _domains.ToList(',');
			}
		}

		/// <summary>
		/// Prüft ob der Server ein DEV-Server ist
		/// </summary>
	    public bool IsDevServer
	    {
		    get { return ServerTyp.ToLower() == "dev"; }
	    }

		/// <summary>
		/// Prüft ob der Server ein Ansichts-Server ist
		/// </summary>
		public bool IsAnsichtServer
		{
			get { return ServerTyp.ToLower() == "ansicht"; }
		}

		/// <summary>
		/// Prüft ob der Server ein LIVE-Server ist
		/// </summary>
		public bool IsLiveServer
		{
			get { return ServerTyp.ToLower() == "live"; }
		}
    }
}