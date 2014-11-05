using System;
using System.ComponentModel;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Routing;
using Piranha.Extend.Regions;
using Piranha.Mvc;

namespace JM.Foundation.Mvc.Helper
{
	public static class Helper
	{
		//////////////////////////////////////////////////////////////////////////////////////
		#region extensions für mvc html helpers

		public static string GetFullHtmlFieldName<TModel, TProperty>(this HtmlHelper<TModel> helper, Expression<Func<TModel, TProperty>> expression)
		{
			return helper.ViewData.TemplateInfo.GetFullHtmlFieldName(expression);
		}

		public static string GetFullHtmlFieldId<TModel, TProperty>(this HtmlHelper<TModel> helper, Expression<Func<TModel, TProperty>> expression)
		{
			return helper.ViewData.TemplateInfo.GetFullHtmlFieldId(expression);
		}

		public static string GetFullHtmlFieldName<TModel, TProperty>(this TemplateInfo templateInfo, Expression<Func<TModel, TProperty>> expression)
		{
			return templateInfo.GetFullHtmlFieldName(ExpressionHelper.GetExpressionText(expression));
		}

		public static string GetFullHtmlFieldId<TModel, TProperty>(this TemplateInfo templateInfo, Expression<Func<TModel, TProperty>> expression)
		{
			return templateInfo.GetFullHtmlFieldId(ExpressionHelper.GetExpressionText(expression));
		}

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region helper für Piranha-Content

		/// <summary>
		/// Schreibt ein img - oder object-Tag für die Darstellung von Piranha-Bildern
		/// </summary>
		/// <param name="image">Image-Objekt von Piranha</param>
		/// <param name="width">optional: Breite in Pixeln für Bitmapgrafiken</param>
		/// <param name="height">optional: Höhe in Pixeln für Bitmapgrafiken</param>
		/// <returns>MvcHtmlString tag</returns>
		public static MvcHtmlString Image(this HtmlHelper helper, ImageRegion image, int width = 0, int height = 0)
		{
			return Image(helper, image, null, width, height);
		}

		/// <summary>
		/// Schreibt ein img - oder object-Tag für die Darstellung von Piranha-Bildern
		/// </summary>
		/// <param name="image">Image-Objekt von Piranha</param>
		/// <param name="htmlAttributes">object mit Html-Attributen, werden dem Tag hinzugefügt</param>
		/// <param name="width">optional: Breite in Pixeln für Bitmapgrafiken</param>
		/// <param name="height">optional: Höhe in Pixeln für Bitmapgrafiken</param>
		/// <returns>MvcHtmlString tag</returns>
		public static MvcHtmlString Image(this HtmlHelper helper, ImageRegion image, object htmlAttributes, int width = 0, int height = 0)
		{
			if (image == null)
				return MvcHtmlString.Create(String.Empty);

			TagBuilder tag = null;

			if (image.Name.ToLower().EndsWith(".svg"))
			{
				tag = new TagBuilder("object");
				tag.Attributes.Add("type", "image/svg+xml");
				tag.Attributes.Add("data", UI.Content(image.Id).ToString());
			}
			else
			{
				tag = new TagBuilder("img");
				tag.Attributes.Add("src", UI.Content(image.Id, width, height).ToString());
				tag.Attributes.Add("alt", image.Description);
			}

			if (htmlAttributes != null)
				tag.MergeAttributes(ExtendedRouteValueDictionary(htmlAttributes));

			return
				MvcHtmlString.Create(tag.ToString());
		}

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region Erweiterung des Routevaluedictionary

		/// <summary>
		/// Gibt das Routevaluedictionary wieder zurück, es wird nur aus dem Parameter "WT_ad" ein "WT.ad" gemacht, da "-" und "." nicht in den keys für 
		/// das anonyme Object erlaubt sind. Bei Gelegenheit und Notwendigkeit erweitern!
		/// </summary>
		/// <param name="htmlAttributes"></param>
		/// <returns></returns>
		public static RouteValueDictionary ExtendedRouteValueDictionary(object htmlAttributes)
		{
			var result = new RouteValueDictionary();

			if (htmlAttributes != null)
			{
				foreach (PropertyDescriptor property in TypeDescriptor.GetProperties(htmlAttributes))
				{
					result.Add(property.Name.Replace('_', '-'), property.GetValue(htmlAttributes));
				}
			}

			return result;
		}

		#endregion
	}
}
