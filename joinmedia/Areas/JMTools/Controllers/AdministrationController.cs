using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;
using System.Web.Mvc;
using JM.Foundation.Mvc.Filter;
using joinmedia.Areas.JMTools.Models;
using joinmedia.Infrastructure.LandingPage;

namespace joinmedia.Areas.JMTools.Controllers
{
	/// <summary>
	/// 25.07.2014 - Sebastian van Elten
	/// AdministrationController für den JMTools-Bereich
	/// Zugang ist mit BASIC-Authentication geschützt
	/// </summary>
	[JMBasicAuthFilter]
	public class AdministrationController : Controller
	{
		#region private Member

		#endregion

		#region Constructor

		public AdministrationController()
		{
		}

		#endregion

		#region Views

		/// <summary>
		/// Index
		/// </summary>
		/// <returns>View</returns>
		public ActionResult Index()
		{
			return View();
		}

		public ActionResult UpdateFrontEndCacheKey()
		{
			return View();
		}

		public ActionResult EventTracing()
		{
			return View(getAllTraces());
		}

		public ActionResult AkquiseLandingPages()
		{
			var pages = LandingPageHandler.LandingPages;
			var keys = pages.Keys;
			var model = new List<PageInfo>();

			foreach (var key in keys)
			{
				var c = pages[key];
				model.Add(new PageInfo
				{
					Name = c.PageTitle,
					LiveUrl = string.Format("http://www.joinmedia.de/{0}", c.Deeplink),
					PreviewUrl = string.Format("/{0}?preview=1", c.Deeplink),
					CreatedAt = c.CreatedAt
				});

			}
			model = model.OrderBy(item => item.Name).ToList();

			return View(model);
		}


		#endregion

		#region PartialViews

		public PartialViewResult SearchTraces(string text, string name)
		{
			return PartialView("_TracesTable", searchTraces(text, name).ToList());
		}
		public PartialViewResult GetAllTraces()
		{
			return PartialView("_TracesTable", getAllTraces());
		}
		public PartialViewResult SortTraces(string sort, string sortBy, string name = "", string text = "")
		{
			var model = searchTraces(text, name);
			switch (sort)
			{
				case "desc":
					model = model.OrderByDescending(p => typeof(Trace).GetProperty(sortBy).GetValue(p, null));
					break;
				default:
					model = model.OrderBy(p => typeof(Trace).GetProperty(sortBy).GetValue(p, null));
					break;
			}
			return PartialView("_TracesTable", model.ToList());
		}

		#endregion

		#region PrivateMethods

		private IEnumerable<Trace> searchTraces(string text, string name)
		{
			var traces = getAllTraces();
			if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(text))
			{
				return traces.Where(
					p => typeof(Trace).GetProperty(name).GetValue(p, null).ToString().ToLower().Contains(text.ToLower()));
			}
			return traces;
		}
		private IEnumerable<Trace> getAllTraces()
		{
			var traces = new List<Trace>();

			using (var connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["EventTracingSqlSink"].ConnectionString))
			{
				connection.Open();
				using (var cmd = new SqlCommand("SELECT * FROM Traces", connection))
				{
					using (var reader = cmd.ExecuteReader())
					{
						while (reader.Read())
						{
							var trace = new Trace();

							foreach (var property in typeof(Trace).GetProperties())
							{
								property.SetValue(trace, reader[property.Name].ToString());
							}
							traces.Add(trace);
						}
					}
				}
			}
			return traces;
		}

		#endregion
	}
}