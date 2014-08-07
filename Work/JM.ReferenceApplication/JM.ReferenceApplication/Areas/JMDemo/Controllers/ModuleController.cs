using System.Web.Mvc;

namespace JM.ReferenceApplication.Areas.JMDemo.Controllers
{
	/// <summary>
	/// Controller für die Startseite der Demos einzelner Module inkl kurzer Beschreibung
	/// </summary>
	public class ModuleController : Controller
	{
		#region private Member

		#endregion

		#region Constructor

		public ModuleController()
		{
		}

		#endregion

		#region Views

		/// <summary>
		/// Index gibt es hier nicht, redirect zur Startseite
		/// </summary>
		/// <returns>Redirect</returns>
		public ActionResult Index()
		{
			return RedirectToActionPermanent("Index", "Start");
		}

		/// <summary>
		/// Startseite für JM.Business.Kontakt
		/// </summary>
		/// <returns>View</returns>
		public ActionResult JM_Business_Kontakt()
		{
			return View();
		}

		/// <summary>
		/// Startseite für JM.Business
		/// </summary>
		/// <returns>View</returns>
		public ActionResult JM_Business()
		{
			return View();
		}

		/// <summary>
		/// Startseite für JM.Foundation
		/// </summary>
		/// <returns>View</returns>
		public ActionResult JM_Foundation()
		{
			return View();
		}

		#endregion

		#region PartialViews

		#endregion
	}
}