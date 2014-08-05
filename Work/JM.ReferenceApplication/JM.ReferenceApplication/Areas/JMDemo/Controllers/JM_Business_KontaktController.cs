using System;
using System.Web.Mvc;
using JM.Business.Kontakt.Contracts.Manager;
using JM.ReferenceApplication.Areas.JMDemo.Models.JM.Business.Kontakt;
using Microsoft.AspNet.Identity;
using JM.Business.Kontakt.Contracts.Model;

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

		private readonly IKontaktManager _kontaktManager;

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Constructor

		public JM_Business_KontaktController(
            IKontaktManager kontaktManager)
		{
			_kontaktManager = kontaktManager;
		}

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Views

		public ActionResult Index()
        {
	        var model = _kontaktManager.GetStartModel(User.Identity.GetUserId());
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

		[HttpGet]
		public ActionResult StoreData()
		{
			var model = _kontaktManager.GetPersonalData(User.Identity.GetUserId());
			return View(model);
		}

		[HttpPost]
		public ActionResult StoreData(PersonalData model)
		{
			if(!ModelState.IsValid)
				return View(model);

			model.LastEditAt = DateTime.Now;
			_kontaktManager.SavePersonalData(model);

			return View("StoreData_Danke");
		}

		/// <summary>
		/// CreateRequest
		/// </summary>
		/// <returns>View</returns>
		public ActionResult CreateRequest()
		{
			var userData = _kontaktManager.GetPersonalData(User.Identity.GetUserId());

            var model = DependencyResolver.Current.GetService<ContactModel>();

            model.UserID = userData.UserID;
            model.Email = userData.Email;
            model.Salutation = userData.Salutation;
            model.FirstName = userData.FirstName;
            model.LastName = userData.LastName;
			
			return View("CreateRequest", model);
		}

		[HttpPost]
		public ActionResult CreateRequest(ContactModel model)
		{
			if (!ModelState.IsValid)
				return View(model);

			_kontaktManager.SendContactMail(model);

			return View("CreateRequest_Danke", model);
		}

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region PartialViews

		//

		#endregion
	}
}