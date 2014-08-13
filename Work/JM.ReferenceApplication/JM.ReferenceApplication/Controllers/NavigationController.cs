using System.Web.Mvc;
using Piranha.Models;

namespace JM.ReferenceApplication.Controllers
{
	/// <summary>
	/// 13.08.2014 - Sebastian van Elten
	/// NavigationController
	/// </summary>
	public class NavigationController : Controller
	{
		//////////////////////////////////////////////////////////////////////////////////////
		#region private Member

		//

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Constructor

		public NavigationController()
		{

		}

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Views

		//

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region PartialViews

		public PartialViewResult _Navigation()
		{
			return PartialView(Sitemap.GetStructure());
		}

		#endregion
	}
}