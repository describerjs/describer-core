using Piranha.Extend;
using System;
using System.ComponentModel.Composition;
using Extension = Piranha.Extend.Extension;

    [Export(typeof(IExtension))]
	[ExportMetadata("InternalId", "InPageNavigationElement")]
	[ExportMetadata("Name", "InPageNavigationElement")]
    [ExportMetadata("Type", ExtensionType.Region)]
    [Serializable]
	public class InPageNavigationElement : Extension
    {
        public string Text { get; set; }
    }