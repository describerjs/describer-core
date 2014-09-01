using System;
using System.Linq.Expressions;
using System.Web.Mvc;

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
	}
}
