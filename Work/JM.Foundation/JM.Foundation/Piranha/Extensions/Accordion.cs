using Piranha.Extend;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using Piranha.Extend.Regions;
using Extension = Piranha.Extend.Extension;

    [Export(typeof(IExtension))]
	[ExportMetadata("InternalId", "Accordion")]
	[ExportMetadata("Name", "Accordion")]
    [ExportMetadata("Type", ExtensionType.Region)]
    [Serializable]
	public class Accordion : Extension
    {
	    private IList<TextRegion> _elements;

	    public IList<TextRegion> Elements
	    {
		    get { return _elements ?? (_elements = new List<TextRegion> { new TextRegion() }); }
		    set { _elements = value; }
	    }

		public bool Hide { get; set; }
    }