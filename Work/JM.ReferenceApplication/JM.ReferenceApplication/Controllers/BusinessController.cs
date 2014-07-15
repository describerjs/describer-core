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

		public ActionResult Lame()
		{
			var model = _lameManager.GetCompleteData();
			return View(model);
		}
	}
}