using System;
using System.IO;
using System.IO.Compression;
using System.Net;
using System.Web.Mvc;

namespace JM.ReferenceApplication.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Demo()
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }
	}
}