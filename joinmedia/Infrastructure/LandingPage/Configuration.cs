using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using joinmedia.Infrastructure.Models;

namespace joinmedia.Infrastructure.LandingPage
{
	public class Configuration
	{
		private static string _defaultFrom;
		private static string _defaultTo;
		private static string _landingPageVisitsTo;
		private static string _smtpServer;
		private static string _landingPageImagesPath;
		private static string _landingPageImagesFsPath;

		/// <summary>
		/// Default email sender address
		/// </summary>
		public static string DefaultFrom
		{
			get { return _defaultFrom ?? (_defaultFrom = ConfigurationManager.AppSettings["DefaultFrom"]); }
		}

		/// <summary>
		/// Default email recipient address
		/// </summary>
		public static string DefaultTo
		{
			get { return _defaultTo ?? (_defaultTo = ConfigurationManager.AppSettings["DefaultTo"]); }
		}

		/// <summary>
		/// LandingPage visit email recipient address
		/// </summary>
		public static string LandingPageVisitsTo
		{
			get { return _landingPageVisitsTo ?? (_landingPageVisitsTo = ConfigurationManager.AppSettings["LandingPageVisitsTo"]); }
		}

		/// <summary>
		/// SMTP server address
		/// </summary>
		public static string SmtpServer
		{
			get { return _smtpServer ?? (_smtpServer = ConfigurationManager.AppSettings["SmtpServer"]); }
		}

		/// <summary>
		/// Landing page images root folder web path
		/// </summary>
		public static string LandingPageImagesWebPath
		{
			get { return _landingPageImagesPath ?? (_landingPageImagesPath = ConfigurationManager.AppSettings["LandingPageImagesPath"]); }
		}

		/// <summary>
		/// Landing page images root folder filesystem path
		/// </summary>
		public static string LandingPageImagesFsPath
		{
			get { return _landingPageImagesFsPath ?? (_landingPageImagesFsPath = HttpContext.Current.Server.MapPath(LandingPageImagesWebPath)); }
		}

		public static Dictionary<string, LandingPageInfo> LandingPages
		{
			get { return ParseLandingPages(); }
		}

		private static Dictionary<string, LandingPageInfo> ParseLandingPages()
		{
			var pages = new Dictionary<string, LandingPageInfo>();
			var webPath = LandingPageImagesWebPath;
			var fsPath = LandingPageImagesFsPath;
			var folders = Directory.GetDirectories(fsPath);
			foreach (var folderName in folders)
			{
				var deeplink = folderName.Split(new[] { '/', '\\' }, StringSplitOptions.RemoveEmptyEntries).Last().ToLower();
				var files = Directory.GetFiles(folderName);
				var lpInfo = new LandingPageInfo();
				foreach (var filename in files)
				{
					lpInfo.Deeplink = deeplink.ToLower();
					var fi = new FileInfo(filename);
					var nameParts = fi.Name.Substring(0, fi.Name.Length - fi.Extension.Length).Split(new[] { '-' }, 2);
					if (nameParts.Length < 2)
						continue; // bad filename

					lpInfo.CreatedAt = fi.CreationTime;
					lpInfo.PageTitle = nameParts[1].Replace('_', ' ');
					var url = string.Format("{0}/{1}/{2}", webPath, deeplink, fi.Name);
					switch (nameParts[0].ToLower())
					{
						case "desktop":
							lpInfo.DesktopScreenshotUrl = url;
							break;
						case "tablet":
							lpInfo.TabletScreenshotUrl = url;
							break;
						case "mobile":
							lpInfo.MobileScreenshotUrl = url;
							break;
						default:
							continue; // bad image prefix
					}
				}
				if (string.IsNullOrEmpty(lpInfo.DesktopScreenshotUrl) && string.IsNullOrEmpty(lpInfo.TabletScreenshotUrl) && string.IsNullOrEmpty(lpInfo.MobileScreenshotUrl))
					continue; // no suitable images found
				if (pages.ContainsKey(deeplink))
				{
					pages[deeplink] = lpInfo;
				}
				else
				{
					pages.Add(deeplink, lpInfo);
				}
			}
			return pages;
		}
	}
}