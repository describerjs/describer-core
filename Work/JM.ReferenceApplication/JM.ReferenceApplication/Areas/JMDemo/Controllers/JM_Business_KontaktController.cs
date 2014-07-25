using System.Web.Mvc;
using JM.Business.Kontakt.Contracts.Manager;
using JM.ReferenceApplication.Areas.JMDemo.Models.JM.Business._Kontakt;

namespace JM.ReferenceApplication.Areas.JMDemo.Controllers
{
	/// <summary>
	/// 25.07.2014 - Sebastian van Elten
	/// JM_Business_KontaktController
	/// </summary>
	public class JM_Business_KontaktController : Controller
	{
		//////////////////////////////////////////////////////////////////////////////////////
		#region private Member

		private IKontaktManager _kontaktManager;

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Constructor

		public JM_Business_KontaktController(IKontaktManager kontaktManager)
		{
			_kontaktManager = kontaktManager;
		}

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Views

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

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region PartialViews

		//

		#endregion
	}
}