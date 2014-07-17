using JM.Business.Manager;
using System.Web.Mvc;

namespace JM.ReferenceApplication.Controllers
{
    public class BusinessController : Controller
    {
		private ILameManager _lameManager;
		private IImportantManager _importantManager;

		public BusinessController(IImportantManager importantManager, ILameManager lameManager)
		{
			_lameManager = lameManager;
			_importantManager = importantManager;
		}

        public ActionResult Index()
        {
            return View();
        }

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
	}

	public class StringManagerModel
	{
		public int ID { get; set; }
		public string String { get; set; }
		public string Manager { get; set; }
	}
}