using System.Web.Mvc;
using Piranha.Mvc;

namespace JM.ReferenceApplication.Controllers
{
	/// <summary>
	/// The post controller is the standard controller displaying a post
	/// generated from the manager interface.
	/// </summary>
    public class PostController : SinglePostController
    {
		/// <summary>
		/// Gets a standard post.
		/// </summary>
		/// <returns>The view result</returns>
        public ActionResult Index() 
        {
			var model = GetModel();
            return View(model.GetView(), model);
        }
    }
}
