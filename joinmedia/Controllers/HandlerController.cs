using System;
using System.Linq;
using System.Net.Mail;
using System.Web;
using JM.Foundation.Utils;
using joinmedia.Infrastructure;
using joinmedia.Infrastructure.LandingPage;
using joinmedia.Infrastructure.Models;
using Piranha.Models;
using System.Web.Mvc;

namespace joinmedia.Controllers
{
	/// <summary>
	/// Nimmt Ajaxe etc entgegen
	/// </summary>
	public class HandlerController : Controller
	{
		#region PartialViews

		[HttpPost]
		public ActionResult _Update()
		{
			if (Request.UrlReferrer != null)
			{
				var qs = HttpUtility.ParseQueryString(Request.UrlReferrer.Query);
				if (qs["preview"] != null)
					return Content("");
			}

			string contactAddress = string.Empty;
			string message = string.Empty;
			bool hasError = true;
			if (!string.IsNullOrEmpty(Request.Params["kontakt"]) && !string.IsNullOrEmpty(Request.Params["message"]))
			{
				contactAddress = Request.Params["kontakt"];
				message = Request.Params["message"];
				try
				{
					var email = new MailMessage(Configuration.DefaultFrom, Configuration.DefaultTo, "Kontaktformular", string.Format("Nachricht: {0}{2}Kontakt: {1}", message, contactAddress, Environment.NewLine));

					var client = new SmtpClient(Configuration.SmtpServer);

					client.Send(email);
					hasError = false;
				}
				catch (Exception)
				{
					hasError = true;
				}
			}

			return Content(string.Format("Folgendes empfangen: Kontakt: {0}, Nachricht: {1}{2}Fehlerfrei versendet: {3}", contactAddress, message, Environment.NewLine, !hasError));
		}

		#endregion
	}
}