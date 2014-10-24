using System;
using System.ComponentModel.Composition;
using Piranha.Extend;
using Piranha.Extend.Regions;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "OnePageSection")]
[ExportMetadata("Name", "OnePageSection")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class OnePageSection : Extension
{
    public string Headline
    {
        get;
        set;
    }
    
    public string Content
    {
        get;
        set;
    }

    public string NavigationName
    {
        get;
        set;
    }

	public ImageRegion Image { get; set; }

	public bool Hide { get; set; }
}