using System;
using System.Web.Mvc;
using JM.Business.Kontakt.Contracts.Manager;
using JM.Business.Kontakt.Contracts.Model;
using Microsoft.AspNet.Identity;

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

		[HttpGet]
		public ActionResult StoreFamilyData()
		{
			var model = _kontaktManager.GetFamilyModel(User.Identity.GetUserId());
			return View(model);
		}

		[HttpPost]
		public ActionResult StoreFamilyData(IFamilyModel model)
		{
			if (!ModelState.IsValid)
				return View(model);


			return View("StoreFamilyData_Danke", model);
		}

		[HttpGet]
		public ActionResult StoreData()
		{
			var model = _kontaktManager.GetPersonalData(User.Identity.GetUserId());
			return View(model);
		}

		[HttpPost]
		public ActionResult StoreData(IPersonalData model)
		{
			if (!ModelState.IsValid)
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
			var model = _kontaktManager.GetContactModel();

            model.UserID = userData.UserID;
            model.Email = userData.Email;
            model.Salutation = userData.Salutation;
            model.FirstName = userData.FirstName;
            model.LastName = userData.LastName;

			return View("CreateRequest", model);
		}

		[HttpPost]
		public ActionResult CreateRequest(IContactModel model)
		{
			if (!ModelState.IsValid)
				return View(model);

			_kontaktManager.SendContactMail(model);

			return View("CreateRequest_Danke", model);
		}

		#endregion

		#region PartialViews

		#endregion
	}
}