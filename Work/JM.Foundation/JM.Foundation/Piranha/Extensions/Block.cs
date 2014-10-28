using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Web.Mvc;
using Piranha.Areas.Manager.Views.Comment;
using Piranha.Extend;
using Piranha.Extend.Regions;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "Block")]
[ExportMetadata("Name", "Block")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class Block : Extension
{
	private ImageRegion _image;

	public string Headline { get; set; }
	public string Content { get; set; }
	public string Anchor{ get; set; }
	public string ImageOrientation { get; set; }
	public bool Hide { get; set; }
	
	public ImageRegion Image 
	{ 
		get { return _image ?? (_image = new ImageRegion()); }
		set { _image = value; }
	}

	public List<SelectListItem> ImageOrientationSelection
	{
		get
		{
			return new List<SelectListItem>
			{
				new SelectListItem {Text = "Keine", Value = ""},
				new SelectListItem {Text = "Links", Value = "left"},
				new SelectListItem {Text = "Rechts", Value = "right"}
			};
		}
	}
}