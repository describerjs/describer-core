using Piranha.Extend;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using Piranha.Extend.Regions;
using Extension = Piranha.Extend.Extension;

    [Export(typeof(IExtension))]
    [ExportMetadata("InternalId", "TabsRegion")]
	[ExportMetadata("Name", "TabsRegion")]
    [ExportMetadata("Type", ExtensionType.Region)]
    [Serializable]
	public class TabsRegion : Extension
    {
		public IList<TextRegion> Tabs { get; set; }
    }