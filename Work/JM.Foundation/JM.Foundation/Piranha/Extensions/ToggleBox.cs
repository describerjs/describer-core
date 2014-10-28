using Piranha.Extend;
using System;
using System.ComponentModel.Composition;
using Extension = Piranha.Extend.Extension;

    [Export(typeof(IExtension))]
    [ExportMetadata("InternalId", "ToggleBox")]
	[ExportMetadata("Name", "ToggleBox")]
    [ExportMetadata("Type", ExtensionType.Region)]
    [Serializable]
    public class ToggleBox : Extension
    {
		public string Headline { get; set; }
		public string Content { get; set; }
		public bool Hide { get; set; }
    }