using System.Web.Mvc;
using JM.Foundation.Mvc.Validation;

namespace JM.ReferenceApplication.Controllers
{
    public class ValidationController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View(new TestPostModel());
        }

		[HttpPost]
		public ActionResult Index(TestPostModel model)
		{
			if(!ModelState.IsValid)
				return View(model);

			return View("IndexDanke");
		}
	}

	public class TestPostModel
	{
		public string StringA { get; set; }

		[RegexValidation("^([a-zA-Z]{2,5)$", true, "Bitte geben Sie nichts oder zwischen 2 und 5 Buchstaben ein")]
		public string StringB { get; set; }

		[RegexValidation("^([a-zA-Z]{2,5)$", false, "Bitte geben Sie zwischen 2 und 5 Buchstaben ein")]
		public string StringC { get; set; }
	}
}