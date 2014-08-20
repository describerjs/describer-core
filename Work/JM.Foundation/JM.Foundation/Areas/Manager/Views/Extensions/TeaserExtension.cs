using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using JM.Foundation.SharedViews;
using Piranha.Extend;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "TeaserExtension")]
[ExportMetadata("Name", "Teaser")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class TeaserExtension : Extension
{
    public string Header
    {
        get;
        set;
    }
    
    public string FooterText
    {
        get;
        set;
    }

    public string FooterLink
    {
        get;
        set;
    }

    public IList<string> BulletPoints { get; set; }

    public PictureFillModel Image { get; set; }
}