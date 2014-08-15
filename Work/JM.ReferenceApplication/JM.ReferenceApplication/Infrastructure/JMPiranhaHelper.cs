using Piranha;
using Piranha.Models;
using System;
using System.Web;

namespace JM.ReferenceApplication.Infrastructure
{
	public class JMPiranhaHelper
	{
		public static string GenerateUrl(ISitemap page)
		{
			if (page != null)
			{
				if (!String.IsNullOrEmpty(page.Redirect))
				{
					if (page.Redirect.Contains("://"))
						return page.Redirect;
					else if (page.Redirect.StartsWith("~/"))
						return Url(page.Redirect);
				}
				if (page.IsStartpage)
					return Url("~/");
				return Url("~/" + (!Config.PrefixlessPermalinks ?
					Piranha.Application.Current.Handlers.GetUrlPrefix("PERMALINK").ToLower() + "/" : "") + page.Permalink.ToLower());
			}
			return "";
		}

		private static string Url(string virtualpath)
		{
			var request = HttpContext.Current.Request;
			return virtualpath.Replace("~/", request.ApplicationPath + (request.ApplicationPath != "/" ? "/" : ""));
		}
	}
}