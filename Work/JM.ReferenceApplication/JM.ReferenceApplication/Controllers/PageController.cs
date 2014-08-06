using System.Web.Mvc;
using Piranha.Mvc;

namespace JM.ReferenceApplication.Controllers
{
	/// <summary>
	/// The page controller is the standard controller displaying a page
	/// generated from the manager interface.
	/// </summary>
    public class PageController : SinglePageController
    {
		/// <summary>
		/// Gets a standard page.
		/// </summary>
		/// <returns>The view result</returns>
        public ActionResult Index() 
        {
			var model = GetModel();
            return View(model.GetView(), model);
        }
    }
}
