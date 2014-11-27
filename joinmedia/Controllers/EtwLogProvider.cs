using joinmedia.Common.Monitoring;
using Piranha.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace joinmedia.Controllers
{
	/// <summary>
	/// Klasse wird wieder entfernt.
	/// </summary>
	public class EtwLogProvider : ILogProvider
	{
		public void Error(string origin, string message, Exception details = null)
		{
			if (details == null)
			{
				ApplicationEvents
					.Log
					.PiranhaError(
						origin ?? string.Empty,
						message ?? string.Empty);
			}
			else
			{
				ApplicationEvents
					.Log
					.PiranhaException(
						origin ?? string.Empty,
						message ?? string.Empty,
						details.ToString());
			}
		}
	}
}