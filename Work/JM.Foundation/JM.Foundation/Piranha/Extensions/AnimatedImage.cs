using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using JM.Foundation.Piranha.Models;
using Piranha.Extend;
using Piranha.Extend.Regions;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "AnimatedImage")]
[ExportMetadata("Name", "AnimatedImage")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class AnimatedImage : Extension
{
	//////////////////////////////////////////////////////////////////////////////////////
	#region private Member

	private ImageRegion _image;
	private float _parallaxValue;

	#endregion

	//////////////////////////////////////////////////////////////////////////////////////
	#region public Member

	/// <summary>
	/// Das Bild, auf das die Animation angewandt wird
	/// </summary>
	public ImageRegion Image
	{
		get { return _image ?? (_image = new ImageRegion()); }
		set { _image = value; }
	}

	/// <summary>
	/// Der anzuwendende Effekt
	/// </summary>
	public string ImageEffect { get; set; }

	/// <summary>
	/// Liste wählbarer Effekte
	/// </summary>
	public List<SelectListItem> ImageEffectSelection
	{
		get { return ImageAnimationSelection.Get(); }
	}

	/// <summary>
	/// Stärke des Parallaxeffektes
	/// </summary>
	[Range(1, 2, ErrorMessage = "Der Wert muss eine Kommazahl zwischen 1 und 2 sein.")]
	public float ParallaxValue
	{
		get
		{
			if(_parallaxValue == 0)
				_parallaxValue = 1;
			return _parallaxValue;
		}
		set { _parallaxValue = value; }
	}

	/// <summary>
	/// Element ausblenden
	/// </summary>
	public bool Hide { get; set; }

	#endregion
}