using System.Web.Mvc;

namespace JM.ReferenceApplication.Controllers
{
    public class ErrorController : Controller
    {
        /// <summary>
        /// Erzeugt die Fehlerseite für den Kunden mit Informationen aus dem ErrorHttpModule
        /// </summary>
        /// <param name="statusCode">Http-Fehlercode</param>
        /// <param name="message">Message aus der Exception</param>
        /// <returns>View</returns>
        public ActionResult DisplayError(int statusCode, string message)
        {
			ViewBag.Code = statusCode;
			ViewBag.Message = message;
	        Response.StatusCode = statusCode;
            return View();
        }

	    public ActionResult DisplayErrorAlternative(int statusCode, string message)
	    {
			ViewBag.Code = statusCode;
			ViewBag.Message = message;
			Response.StatusCode = statusCode;
			return View();
	    }
    }
}