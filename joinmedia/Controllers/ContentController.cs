﻿using System;
using System.Linq;
using System.Web;
using JM.Foundation.Utils;
using joinmedia.Infrastructure;
using joinmedia.Infrastructure.LandingPage;
using joinmedia.Infrastructure.Models;
using Piranha.Models;
using System.Web.Mvc;
using Configuration = JM.Foundation.Mvc.Helper.Configuration;

namespace joinmedia.Controllers
{
	/// <summary>
	/// Stellt Partialviews für verschiedene technische Partialviews bereit.
	/// </summary>
	public class ContentController : Controller
	{
		#region private Member

		#endregion

		#region Constructor

		public ContentController()
		{
		}

		#endregion

		#region Views

		/// <summary>
		/// Gibt das generierte JS für Main.JS zurück, die im View anhand der Feature-Config 
		/// zusammengebaut wird.
		/// Der Outputcache verhindert das die JS bei jedem Request neu gebaut wird, statt dessen
		/// kommt sie für die konfigurierte Zahl an Sekunden aus dem Cache, es sei denn der "id"
		/// Parameter ist anders
		/// </summary>
		/// <param name="id">Versions-String für die Erzeugung</param>
		/// <returns>View mit generiertem Html</returns>
		[OutputCache(Duration = 120, VaryByParam = "id")]
		public ActionResult MainJS(string id)
		{
			return View("MainJS", null, id);
		}

		/// <summary>
		/// Speichert die ID eines ausgewählten Templates in der Session und leitet dann weiter
		/// </summary>
		/// <param name="key">ID des Templates</param>
		/// <returns></returns>
		public ActionResult SetTemplate(string key = "")
		{
			Configuration.SetActiveTemplateForSession(key);
			return Redirect("/");
		}

		public ActionResult UploadFile()
		{
			return View();
		}

		#endregion

		#region PartialViews

		/// <summary>
		/// Generiert die Hauptnavigation aus der Piranha-Sitemap.
		/// TODO: Outputcaching
		/// </summary>
		/// <returns>PartialViewResult Navigation</returns>
		[ChildActionOnly]
		public PartialViewResult _Navigation()
		{
			return PartialView(Sitemap.GetStructure());
		}

		/// <summary>
		/// Gibt einen Partialview für das Umschalten von Templates zurück
		/// </summary>
		/// <returns></returns>
		public PartialViewResult _StyleSwitcher()
		{
			return PartialView();
		}

		public ActionResult LandingPage(string id)
		{
			var isPreview = RequestParameter.ReadGet("preview", "0") == "1";
			var lpHandler = new LandingPageHandler();
			var model = LandingPageHandler.LandingPages.FirstOrDefault(m => m.Key == id).Value;

			if(model == null)
			{	
				throw new HttpException(404, "Not found");
			}

			model.IsPreview = isPreview;

			if (!isPreview && CurrentRequest.IsRealVisitor)
			{
				lpHandler.SendNotificationEmail(string.Empty, string.Empty, string.Format("http://www.joinmedia.de/{0}?preview=1", id));
				lpHandler.TrackRealVisitor(id);
			}

			Response.AddHeader("X-Robots-Tag", "noindex, nofollow");

			return View(model);
		}

		[HttpPost]
		public ActionResult _Upload(UploadModel model)
		{
			var imageManager = new UploadManager();
			var uploadResult = imageManager.HandleFileUploads();

			if (uploadResult.UploadMode != UploadMode.None)
			{
				model.HasImageUpload = uploadResult.Uploaded;

				if (uploadResult.Uploaded && !uploadResult.IsValid)
					ModelState.AddModelError(Guid.NewGuid().ToString(),
						"Leider konnten wir das Profilbild nicht verarbeiten. Bitte versuche es noch einmal oder wähle ein anderes Bild.");
			}

			if (!ModelState.IsValid)
			{
				return PartialView("Content/_Upload", model);
			}

			return PartialView("Content/_UploadDone");
		}


		#endregion
	}
}