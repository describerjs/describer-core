using System.Collections.Generic;
using System.Web.Mvc;

namespace JM.Foundation.Piranha.Models
{
	public static class ImageAnimationSelection
	{
		public static List<SelectListItem> Get()
		{
			return new List<SelectListItem>
			{
				new SelectListItem {Text = "Kein Effekt", Value = ""},
				new SelectListItem {Text = "Parallax", Value = "parallax"},
				new SelectListItem {Text = "Gyroskop", Value = "gyroscope"},
				new SelectListItem {Text = "Parallax + Gyroskop", Value = "parallax_gyroscope"},
			};
		}
	}
}
