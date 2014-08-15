using System;
using System.ComponentModel.Composition;
using Piranha.Extend;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "TeaserExtension")]
[ExportMetadata("Name", "Teaser")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class TeaserExtension : Piranha.Extend.Regions.HtmlRegion
{
	/// <summary>
    /// Default constructor.
	/// </summary>
	public TeaserExtension() : base() { }

	/// <summary>
    /// Creates a new category description from the given string.
	/// </summary>
	/// <param name="val"></param>
	public TeaserExtension(string val) : base(val) { }

	public string Title { get; set; }
	public string Body { get; set; }
	public string LinkText { get; set; }
	public string LinkUrl { get; set; }
	public string ImageUrl { get; set; }
}