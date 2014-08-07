using System.Web.Mvc;
using JM.Foundation.Mvc.Filter;

namespace JM.ReferenceApplication.Areas.JMDemo.Controllers
{
	/// <summary>
	/// 25.07.2014 - Sebastian van Elten
	/// StartController
	/// </summary>
	[JMBasicAuthFilter]
	public class StartController : Controller
	{
		#region private Member

		#endregion

		#region Constructor

		public StartController()
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