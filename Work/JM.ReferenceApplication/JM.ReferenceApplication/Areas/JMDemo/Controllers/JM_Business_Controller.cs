using System.Web.Mvc;
using JM.Business.Manager;

namespace JM.ReferenceApplication.Areas.JMDemo.Controllers
{
	/// <summary>
	/// 25.07.2014 - Sebastian van Elten
	/// JM_BusinessController
	/// </summary>
	public class JM_BusinessController : Controller
	{
		#region private Member

		private IImportantManager _importantManager;
		private ILameManager _lameManager;

		#endregion

		#region Constructor

		public JM_BusinessController(IImportantManager importantManager, ILameManager lameManager)
		{
			_lameManager = lameManager;
			_importantManager = importantManager;
		}

		#endregion

		#region Views

		public ActionResult Important()
		{
			var model = _importantManager.GetCompleteData();
			return View(model);
		}

		public ActionResult ImportantDetails(int id)
		{
			var model = new StringManagerModel
			{
				String = _importantManager.GetDataByIndex(id),
				ID = id,
				Manager = "ImportantManager"
			};
			return View("Details", model);
		}

		public ActionResult ImportantModuleInfo()
		{
			return View("ImportantModuleInfo", "", _importantManager.GetModuleInfo());
		}

		public ActionResult ImportantConfiguredDeviceInfo(int index = 0)
		{
			ViewBag.Index = index;
			return View("ImportantConfiguredDeviceInfo", "", _importantManager.GetDeviceFromConfig(index));
		}

		public ActionResult Lame()
		{
			var model = _lameManager.GetCompleteData();
			return View(model);
		}

		public ActionResult LameDetails(int id)
		{
			var model = new StringManagerModel
			{
				String = _lameManager.GetDataByIndex(id),
				ID = id,
				Manager = "LameManager"
			};
			return View("Details", model);
		}

		#endregion

		#region PartialViews

		#endregion
	}

}