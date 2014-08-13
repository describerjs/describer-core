using System.Web.Mvc;
using Piranha.Models;

namespace JM.ReferenceApplication.Controllers
{
	/// <summary>
	/// 13.08.2014 - Sebastian van Elten
	/// NavigationController
	/// Stellt Partialviews für Navigationselemente bereit.
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
		
		/// <summary>
		/// Generiert die Hauptnavigation aus der Piranha-Sitemap.
		/// TODO: Outputcaching
		/// </summary>
		/// <returns>PartialViewResult Navigation</returns>
		[ChildActionOnly]
		public PartialViewResult _Navigation()
		{
			return PartialView(Sitemap.GetStructure());
		}

		#endregion
	}
}