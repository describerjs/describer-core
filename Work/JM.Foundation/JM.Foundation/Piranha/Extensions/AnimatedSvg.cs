using Piranha.Extend;
using Piranha.Extend.Regions;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Web.Mvc;

/// <summary>
/// Region zur Definition eines SVG-Bildes mit Animation, für das ein Animationstrigger gewählt werden kann
/// </summary>
[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "AnimatedSvg")]
[ExportMetadata("Name", "AnimatedSvg")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class AnimatedSvg : Extension
{
	//////////////////////////////////////////////////////////////////////////////////////
	#region private Member

	private ImageRegion _image;

	#endregion

	//////////////////////////////////////////////////////////////////////////////////////
	#region public Member

	/// <summary>
	/// SVG-Animiertes SVG-Bild, dessen Animation mit dem Trigger ausgelöst wird
	/// </summary>
	public ImageRegion Image
	{
		get { return _image ?? (_image = new ImageRegion()); }
		set { _image = value; }
	}

	/// <summary>
	/// Ausgewählter Effektauslöser für das SVG
	/// </summary>
	public string EffectTrigger { get; set; }

	/// <summary>
	/// Liste auswählbarer Animationstrigger
	/// </summary>
	public List<SelectListItem> EffectTriggerSelection
	{
		get
		{
			return new List<SelectListItem>
			{
				new SelectListItem {Text = "Kein Effekt", Value = ""},
				new SelectListItem {Text = "Wenn das Bild in den sichtbaren Bereich scrollt", Value = "animation-start-on-view"}
			};
		}
	}

	/// <summary>
	/// Element ausblenden
	/// </summary>
	public bool Hide { get; set; }

	#endregion
}