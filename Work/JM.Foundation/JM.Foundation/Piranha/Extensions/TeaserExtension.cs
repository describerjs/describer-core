using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.ComponentModel.DataAnnotations;
using Piranha.Extend;
using Piranha.Extend.Regions;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "TeaserExtension")]
[ExportMetadata("Name", "Teaser")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class TeaserExtension : Extension
{
	private IList<string> _bulletPoints;
	private ImageRegion _image;

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

	public IList<string> BulletPoints
	{
		get { return _bulletPoints ?? (_bulletPoints = new List<string>{"","","","",""}); }
		set { _bulletPoints = value; }
	}

	public ImageRegion Image
	{
		get { return _image ?? (_image = new ImageRegion()); }
		set { _image = value; }
	}

	public bool EnableParallax { get; set; }

	[Range(1, 3, ErrorMessage = "Der Wert muss eine Kommazahl zwischen 1 und 3 sein.")]
	public float ParallaxValue { get; set; }

	public bool Hide { get; set; }
}