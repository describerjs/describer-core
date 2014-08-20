using Piranha.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JM.ReferenceApplication.Controllers
{
    /// <summary>
    /// Klasse wird wieder entfernt.
    /// </summary>
    public class NullLogProvider : ILogProvider
    {
        public void Error(string origin, string message, Exception details = null)
        {
            // Nothing
        }
    }
}