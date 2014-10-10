using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace JM.Foundation.Mvc.ViewEngine
{
	/// <summary>
	/// Wenn ein Template ausgewählt ist, werden die Suchpfade für View, Partial und Layout den entsprechenden Listen hinzugefügt.
	/// Ansonsten verhält sich die ViewEngine wie die Basis-Klasse
	/// </summary>
	public class TemplateAwareViewEngine : RazorViewEngine
	{
		public TemplateAwareViewEngine()
		{
			var templates = Configuration.ApplicationConfiguration.SiteConfig.Templates;

			var partialViewLocationFormats = new List<string>();
			var viewLocationFormats = new List<string>();
			var masterLocationFormats = new List<string>();

			foreach (var template in templates)
			{
				viewLocationFormats.Add(String.Format("~{0}/Views/{{0}}.cshtml", template.Path));
				viewLocationFormats.Add(String.Format("~{0}/{{1}}/{{0}}.cshtml", template.Path));
				viewLocationFormats.Add(String.Format("~{0}/{{0}}.cshtml", template.Path));

				masterLocationFormats.Add(String.Format("~{0}/Views/{{0}}.cshtml", template.Path));
				masterLocationFormats.Add(String.Format("~{0}/Views/Shared/{{0}}.cshtml", template.Path));
				masterLocationFormats.Add(String.Format("~{0}/{{1}}/{{0}}.cshtml", template.Path));
				masterLocationFormats.Add(String.Format("~{0}/{{0}}.cshtml", template.Path));

				partialViewLocationFormats.Add(String.Format("~{0}/Views/{{0}}.cshtml", template.Path));
				partialViewLocationFormats.Add(String.Format("~{0}/Views/Shared/{{0}}.cshtml", template.Path));
				partialViewLocationFormats.Add(String.Format("~{0}/{{1}}/{{0}}.cshtml", template.Path));
				partialViewLocationFormats.Add(String.Format("~{0}/{{0}}.cshtml", template.Path));
			};


			partialViewLocationFormats.AddRange(PartialViewLocationFormats.ToList());
			viewLocationFormats.AddRange(ViewLocationFormats.ToList());
			masterLocationFormats.AddRange(MasterLocationFormats.ToList());

			PartialViewLocationFormats = partialViewLocationFormats.ToArray();
			ViewLocationFormats = viewLocationFormats.ToArray();
			MasterLocationFormats = masterLocationFormats.ToArray();
		}
	}
}
