using System.Web;
using System.Web.Mvc;

namespace joinmedia
{
	public class FilterConfig
	{
		public static void RegisterGlobalFilters(GlobalFilterCollection filters)
		{
			// Wird nicht gebraucht wenn das Exceptionhandling über das HttpModule kommt
			// filters.Add(new HandleErrorAttribute());
		}
	}
}
