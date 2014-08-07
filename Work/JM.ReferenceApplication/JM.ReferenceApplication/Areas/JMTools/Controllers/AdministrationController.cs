using System.Web.Mvc;
using JM.Foundation.Mvc.Filter;

namespace JM.ReferenceApplication.Areas.JMTools.Controllers
{
	/// <summary>
	/// 25.07.2014 - Sebastian van Elten
	/// AdministrationController für den JMTools-Bereich
	/// Zugang ist mit BASIC-Authentication geschützt
	/// </summary>
	[JMBasicAuthFilter]
	public class AdministrationController : Controller
	{
		#region private Member

		#endregion

		#region Constructor

		public AdministrationController()
		{
		}

		#endregion

		#region Views

		/// <summary>
		/// Index
		/// </summary>
		/// <returns>View</returns>
		public ActionResult Index()
		{
			return View();
		}

		#endregion

		#region PartialViews

		#endregion
	}
}