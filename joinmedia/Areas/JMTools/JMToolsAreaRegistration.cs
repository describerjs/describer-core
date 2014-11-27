using System.Web.Mvc;

namespace joinmedia.Areas.JMTools
{
	public class JMToolsAreaRegistration : AreaRegistration
	{
		public override string AreaName
		{
			get
			{
				return "JMTools";
			}
		}

		public override void RegisterArea(AreaRegistrationContext context)
		{
			context
				.MapRoute(
					"JMTools_default",
					"JMTools/{controller}/{action}/{id}",
					new
					{
						controller = "Administration",
						action = "Index",
						id = UrlParameter.Optional
					});
		}
	}
}