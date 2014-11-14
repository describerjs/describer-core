using System.Linq;
using System.Web.Mvc;
using Piranha.Models.Manager.PageModels;

namespace JM.Foundation.Piranha.Controller
{
	public class PiranhaModelController : System.Web.Mvc.Controller
	{
		[ValidateInput(false)]
		public ActionResult AddTile(EditModel model, int regionID)
		{
			var tileRegion = model.Regions.ToList().ElementAt(regionID);
			var tiles = (Tiles)tileRegion.Body;
			tiles.Elements.Add(new Tile());

			var editModel = new SharedModelEdit() {Regions = model.Regions, RegionID = regionID};

			return PartialView("~/Areas/Manager/Views/Shared/SharedModelEdit.cshtml", editModel);
		}
	}
}