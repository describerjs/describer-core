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

		public bool Hide { get; set; }
    }