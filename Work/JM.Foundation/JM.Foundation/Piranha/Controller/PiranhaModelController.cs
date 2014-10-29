using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.UI.WebControls.WebParts;

namespace JM.Foundation.Piranha.Controller
{
	public class PiranhaModelController : System.Web.Mvc.Controller
	{
		public PartialViewResult AddTile(Tiles model)
		{
			if(model == null)
				model = new Tiles();

			model.Elements.Add(new Tile());

			return PartialView("Tiles.cshtml", model);
		}
	}
}