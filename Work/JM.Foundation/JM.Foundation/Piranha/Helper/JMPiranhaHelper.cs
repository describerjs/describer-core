using Piranha;
using Piranha.Models;
using System;
using System.Diagnostics.Contracts;
using System.Web;

namespace JM.Foundation.Piranha.Helper
{
	public class JMPiranhaHelper
	{
		public static string GenerateUrl(ISitemap page)
		{
			if (page != null)
			{
				if (!string.IsNullOrEmpty(page.Redirect))
				{
                    if (page.Redirect.Contains("://"))
                    {
                        return page.Redirect;
                    }
                    else if (page.Redirect.StartsWith("~/"))
                    {
                        return Url(page.Redirect);
                    }
				}

                if (page.IsStartpage)
                {
                    return Url("~/");
                }

				return 
                    Url("~/" + 
                        (!Config.PrefixlessPermalinks ?
					    global::Piranha.Application.Current.Handlers.GetUrlPrefix("PERMALINK").ToLower() + "/" :
                        string.Empty) + page.Permalink.ToLower());
			}

			return string.Empty;
		}

		private static string Url(string virtualpath)
		{
            Contract.Assume(HttpContext.Current != null);

			var request = HttpContext.Current.Request;
			return virtualpath.Replace("~/", request.ApplicationPath + (request.ApplicationPath != "/" ? "/" : string.Empty));
		}
	}
}