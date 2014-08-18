using System;
using System.ComponentModel.Composition;
using Piranha.Extend;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "TeaserExtension")]
[ExportMetadata("Name", "Teaser")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class TeaserExtension : Piranha.Extend.Extension
{
	/// <summary>
    /// Default constructor.
	/// </summary>
	public TeaserExtension() : base() { }

    public string Title
    {
        get;
        set;
    }

    public string Body
    {
        get;
        set;
    }

    public string LinkText
    {
        get;
        set;
    }

    public string LinkUrl
    {
        get;
        set;
    }

    public string ImageUrl
    {
        get;
        set;
    }
}