using Piranha.Extend;
using System;
using System.ComponentModel.Composition;
using Piranha.Extend.Regions;
using Extension = Piranha.Extend.Extension;

    [Export(typeof(IExtension))]
	[ExportMetadata("InternalId", "Tile")]
	[ExportMetadata("Name", "Tile")]
    [ExportMetadata("Type", ExtensionType.Region)]
    [Serializable]
	public class Tile : Extension
    {
		private ImageRegion _image;

		public string Content { get; set; }
		public ImageRegion Image
		{
			get { return _image ?? (_image = new ImageRegion()); }
			set { _image = value; }
		}

	    public bool Hide { get; set; }
    }