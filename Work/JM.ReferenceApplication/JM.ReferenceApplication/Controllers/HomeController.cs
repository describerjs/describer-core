using System.Web.Mvc;

namespace JM.ReferenceApplication.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}