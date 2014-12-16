using System;
using System.Linq;
using System.Web;

namespace joinmedia.Infrastructure.LandingPage
{
	public class CurrentRequest
	{
		public static string IPAddress
		{
			get
			{
				try
				{
					var forwardedIPs = HttpContext.Current.Request.Headers["X-Forwarded-For"]; //"10.2.27.83, 193.7.145.70"; 
					if (string.IsNullOrEmpty(forwardedIPs))
						return HttpContext.Current.Request.UserHostAddress;

					var ip = forwardedIPs.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Last().Trim();
					return ip;
				}
				catch
				{
					return string.Empty;
				}
			}
		}

		public static bool IsRealVisitor
		{
			get
			{
				if (!string.IsNullOrEmpty(HttpContext.Current.Request.Params["mailtest"]))
					return true;

				var ip = IPAddress;
				if (string.IsNullOrEmpty(ip))
					return false;

				if (ip.StartsWith("127.") || ip.StartsWith("172.30.") || ip == "84.245.143.67" || ip == "84.245.143.73" || ip == "88.78.101.118")
					return false;

				return true;
			}
		}
	}
}