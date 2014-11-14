using System.Web.Mvc;
using Piranha.Extend;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using Extension = Piranha.Extend.Extension;

    [Export(typeof(IExtension))]
	[ExportMetadata("InternalId", "Tiles")]
	[ExportMetadata("Name", "Tiles")]
    [ExportMetadata("Type", ExtensionType.Region)]
    [Serializable]
	public class Tiles : Extension
    {
	    private IList<Tile> _elements;

	    public IList<Tile> Elements
	    {
		    get { return _elements ?? (_elements = new List<Tile> { new Tile() }); }
		    set { _elements = value; }
	    }

		public string Tiling { get; set; }

		public List<SelectListItem> TilingSelection
		{
			get
			{
				return new List<SelectListItem>
			{
				new SelectListItem {Text = "2x2", Value = "2x2"},
				new SelectListItem {Text = "2x3", Value = "2x3"},
				new SelectListItem {Text = "1x4", Value = "1x4"},
				new SelectListItem {Text = "1x6", Value = "1x6"}
			};
			}
		}
		
		public bool Hide { get; set; }
    }