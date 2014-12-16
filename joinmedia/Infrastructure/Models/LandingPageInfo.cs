using System;

namespace joinmedia.Infrastructure.Models
{
	/// <summary>
	/// Summary description for LandingPageInfo
	/// </summary>
	public class LandingPageInfo
	{
		private string _tabletScreenshotUrl;
		private string _mobileScreenshotUrl;

		public LandingPageInfo()
		{
			Deeplink = string.Empty;
			PageTitle = string.Empty;
		}

		public bool IsPreview { get; set; }

		public string Deeplink { get; set; }

		public string PageTitle { get; set; }

		public string DesktopScreenshotUrl { get; set; }

		public DateTime CreatedAt { get; set; }

		public string TabletScreenshotUrl
		{
			get { return _tabletScreenshotUrl ?? DesktopScreenshotUrl; }
			set { _tabletScreenshotUrl = value; }
		}

		public string MobileScreenshotUrl
		{
			get { return _mobileScreenshotUrl ?? TabletScreenshotUrl; }
			set { _mobileScreenshotUrl = value; }
		}
	}
}