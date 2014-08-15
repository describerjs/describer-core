using System.Web.Mvc;
using Piranha.Models;

namespace JM.ReferenceApplication.Controllers
{
	/// <summary>
	/// 13.08.2014 - Sebastian van Elten
	/// ContentController
	/// Stellt Partialviews für verschiedene technische Partialviews bereit.
	/// </summary>
	public class ContentController : Controller
	{
		//////////////////////////////////////////////////////////////////////////////////////
		#region private Member

		//

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Constructor

		public ContentController()
		{

		}

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Views

		/// <summary>
		/// Gibt das generierte JS für Main.JS zurück, die im View anhand der Feature-Config 
		/// zusammengebaut wird.
		/// Der Outputcache verhindert das die JS bei jedem Request neu gebaut wird, statt dessen
		/// kommt sie für die konfigurierte Zahl an Sekunden aus dem Cache, es sei denn der "id"
		/// Parameter ist anders
		/// </summary>
		/// <param name="id">Versions-String für die Erzeugung</param>
		/// <returns>View mit generiertem Html</returns>
		[OutputCache(Duration = 120, VaryByParam = "id")]
		public ActionResult MainJS(string id)
		{
			return View("MainJS", null, id);
		}

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