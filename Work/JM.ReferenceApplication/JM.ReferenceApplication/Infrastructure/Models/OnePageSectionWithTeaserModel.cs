using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JM.ReferenceApplication.Infrastructure.Models
{
	public class OnePageSectionWithTeaserModel
	{
		public OnePageSection Section { get; set; }
		public TeaserExtension Teaser1 { get; set; }
		public TeaserExtension Teaser2 { get; set; }
	}
}