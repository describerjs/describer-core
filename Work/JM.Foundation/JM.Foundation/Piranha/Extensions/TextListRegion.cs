using Piranha.Extend;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using Piranha.Extend.Regions;
using Extension = Piranha.Extend.Extension;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "TextListRegion")]
[ExportMetadata("Name", "TextListRegion")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class TextListRegion : Extension
{
    public IList<TextRegion> TextList { get; set; }
}