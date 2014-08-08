using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Routing;

namespace JM.ReferenceApplication.Infrastructure.Models
{
	public static class Extensions
	{
		public static IHtmlString JMValidationMessageFor<TModel, TValue>(
			this HtmlHelper<TModel> html,
			Expression<Func<TModel, TValue>> expression, 
            object htmlAttributes = null, 
            string errorMessage = null)
		{
            ////var x = ModelMetadata.FromLambdaExpression<TModel, TValue>(expression, html.ViewData);

			var attributes = new RouteValueDictionary(htmlAttributes);

            if (attributes.ContainsKey("class"))
            {
                attributes["class"] += " error-msg";
            }
            else
            {
                attributes.Add("class", "error-msg");
            }

			return html.ValidationMessageFor(expression, errorMessage, attributes);
		}

		public static IHtmlString JMTextBoxFor<TModel, TValue>(
			this HtmlHelper<TModel> htmlHelper,
			Expression<Func<TModel, TValue>> expression, 
            object htmlAttributes = null)
		{
            if (htmlAttributes == null)
            {
                htmlAttributes = new Dictionary<string, object>();
            }

			var content = htmlHelper.TextBoxFor(expression, htmlAttributes);

			return MvcHtmlString.Create(content.ToString().Replace("data-val", "data"));
		}
	}
}