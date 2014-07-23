using JM.Business.Kontakt.Contracts.Manager;
using JM.ReferenceApplication.Models.JM.Kontakt.Business;
using System.Web.Mvc;

namespace JM.ReferenceApplication.Controllers
{
    public class ContactController : Controller
    {
		private IKontaktManager _kontaktManager;

		public ContactController(IKontaktManager kontaktManager)
		{
			_kontaktManager = kontaktManager;
		}
		
        public ActionResult Index()
        {
	        var model = _kontaktManager.GetContactModel();
            return View(model);
        }

	    [HttpPost]
	    public ActionResult Index(ContactModel model)
	    {
		    if (!ModelState.IsValid)
			    return View(model);

			_kontaktManager.SendContactMail(model);

		    return View("Danke", model);
	    }
    }
}