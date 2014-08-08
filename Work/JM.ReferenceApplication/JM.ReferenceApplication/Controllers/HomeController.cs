using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JM.Foundation;

namespace JM.ReferenceApplication.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Errors()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

		public ActionResult CustomError404()
		{
			var ex = new HttpException(404, "Die Seite 'CustomError404' wurde nicht gefunden");
			throw ex;
		}

		public ActionResult CustomErrorNoView()
		{
			return View();
		}

		public ActionResult CustomError()
		{
			var ex = new HttpException(500, "Stuffs broken");
			throw ex;
		}

	    public ActionResult CustomErrorWithUserMessage()
	    {
		    var ex = new JMApplicationException("Hm ich hab wohl ein Semicolon vergessen");
		    ex.UserMessage = "Leider ist das ziemlich schief gegangen";

		    throw ex;
	    }

		public ActionResult CustomErrorWithRedirect()
		{
			var ex = new JMApplicationException("Hm ich hab wohl ein Semicolon vergessen");
			ex.RedirectUrl = "/";

			throw ex;
		}
    }
}