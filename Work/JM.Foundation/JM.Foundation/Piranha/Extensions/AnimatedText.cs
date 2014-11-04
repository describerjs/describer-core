using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Web.Mvc;
using Piranha.Extend;
using Piranha.Extend.Regions;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "AnimatedText")]
[ExportMetadata("Name", "AnimatedText")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class AnimatedText : Extension
{
	private string _textEffect;

	public string Content { get; set; }

	public bool Hide { get; set; }

	public string TextEffect
	{
		get { return _textEffect ?? (_textEffect = string.Empty); }
		set { _textEffect = value; }
	}

	public List<SelectListItem> TextEffectSelection
	{
		get
		{
			return new List<SelectListItem>
			{
				new SelectListItem { Text = "Kein Effekt", Value = string.Empty },
				new SelectListItem { Text = "Fade-In / Out", Value = "fade-in" },
				new SelectListItem { Text = "Slide-In / Out", Value = "slide-in" }
			};
		}
	}
}