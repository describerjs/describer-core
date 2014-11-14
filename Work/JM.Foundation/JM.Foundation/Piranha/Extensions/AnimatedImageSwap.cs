using Piranha.Extend;
using Piranha.Extend.Regions;
using System;
using System.ComponentModel.Composition;

/// <summary>
/// Region zur Darstellung einer Bildertauschanimation.
/// Zwei Bilder werden ausgewählt und auf der Seite über JS/CSS ausgetauscht
/// </summary>
[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "AnimatedImageSwap")]
[ExportMetadata("Name", "AnimatedImageSwap")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class AnimatedImageSwap : Extension
{
	//////////////////////////////////////////////////////////////////////////////////////
	#region private Member

	private ImageRegion _image1; 
	private ImageRegion _image2;

	#endregion

	//////////////////////////////////////////////////////////////////////////////////////
	#region public Member

	/// <summary>
	/// Startbild
	/// </summary>
	public ImageRegion Image1
	{
		get { return _image1 ?? (_image1 = new ImageRegion()); }
		set { _image1 = value; }
	}

	/// <summary>
	/// Ersetzendes bzw animiertes Bild
	/// </summary>
	public ImageRegion Image2
	{
		get { return _image2 ?? (_image2 = new ImageRegion()); }
		set { _image2 = value; }
	}

	/// <summary>
	/// Element ausblenden
	/// </summary>
	public bool Hide { get; set; }

	#endregion
}