using Piranha.Extend;
using Piranha.Extend.Regions;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using Extension = Piranha.Extend.Extension;

    [Export(typeof(IExtension))]
    [ExportMetadata("InternalId", "FaqRegion")]
    [ExportMetadata("Name", "FaqRegionName")]
    [ExportMetadata("Type", ExtensionType.Region)]
    [Serializable]
    public class FaqRegion : Extension
    {
        public IList<TextRegion> Faqs { get; set; }
		public bool Hide { get; set; }
    }