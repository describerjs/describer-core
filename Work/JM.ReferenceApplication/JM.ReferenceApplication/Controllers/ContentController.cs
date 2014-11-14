using JM.Foundation.Mvc.Helper;
using Piranha.Models;
using System.Web.Mvc;

namespace JM.ReferenceApplication.Controllers
{
	/// <summary>
	/// Stellt Partialviews für verschiedene technische Partialviews bereit.
	/// </summary>
	public class ContentController : Controller
	{
		#region private Member

		#endregion

		#region Constructor

		public ContentController()
		{
		}

		#endregion

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

		/// <summary>
		/// Speichert die ID eines ausgewählten Templates in der Session und leitet dann weiter
		/// </summary>
		/// <param name="key">ID des Templates</param>
		/// <returns></returns>
		public ActionResult SetTemplate(string key = "")
		{
			Configuration.SetActiveTemplateForSession(key);
			return Redirect("/");
		}

        #endregion

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

		/// <summary>
		/// Gibt einen Partialview für das Umschalten von Templates zurück
		/// </summary>
		/// <returns></returns>
		public PartialViewResult _StyleSwitcher()
		{
			return PartialView();
		}
		
		#endregion
	}
}