using System;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace JM.Foundation.ErrorHandling
{
	public class ErrorHttpModule : IHttpModule
	{
		//////////////////////////////////////////////////////////////////////////////////////
		#region private Member

		private static string _errorControllerRouteName = "Error";
		private static string _errorControllerAction = "DisplayError";
		private static bool _showErrorDetaíls = true;

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region public Methods

		public void Init(HttpApplication context)
		{
			context.Error += Application_Error;
		}

		public void Dispose()
		{ }

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region private Methods

		private static void Application_Error(object sender, EventArgs e)
		{
			// Exception abhholen
			var exception = HttpContext.Current.Server.GetLastError();

			if (exception is HttpUnhandledException)
				exception = exception.InnerException ?? exception;

			var httpException = exception as HttpException;

			///////////////////////
			// EXCEPTION LOGGING //
			///////////////////////

			var httpStatusCode = httpException != null
				? httpException.GetHttpCode()
				: (int)HttpStatusCode.InternalServerError;

			// Wenn der Fehler im Fehlercontroller passiert wollen wir natürlich keinen Loop
			var p = HttpContext.Current.Request.Path;
			if (HttpContext.Current.Request.Path.ToLower().StartsWith("/" + _errorControllerRouteName.ToLower() + "/"))
			{
				HandleErrorHandlingException(
					"Fehler bei der Erzeugung der Fehlerseite.",
					HttpContext.Current.Server.GetLastError());
			}

			// Fehlerseite anzeigen, falls das fehlschlägt minimale Fehlerseite anzeigen
			try
			{
				var routeData = new RouteData();

				routeData.Values.Add("controller", _errorControllerRouteName);
				routeData.Values.Add("action", _errorControllerAction);
				routeData.Values.Add("statusCode", httpStatusCode);
				routeData.Values.Add("message", httpException.Message);

				var requestContext = new RequestContext(new HttpContextWrapper(HttpContext.Current), routeData);
				var controllerFactory = ControllerBuilder.Current.GetControllerFactory();
				var controller = controllerFactory.CreateController(requestContext, _errorControllerRouteName);

				controller.Execute(requestContext);

				HttpContext.Current.Server.ClearError();
			}
			catch (Exception renderException)
			{
				HandleErrorHandlingException("Fehler bei der Erzeugung der Fehlerseite.", httpException, renderException);
			}
		}

		private static void HandleErrorHandlingException(string message, Exception handledException, Exception exception = null)
		{
			// Hier direkt in die Response schreiben, alternativ einen Redirect zu einer statischen Seite

			var response = HttpContext.Current.Response;

			response.ClearHeaders();
			response.ClearContent();
			response.StatusCode = (int)HttpStatusCode.InternalServerError;
			HttpContext.Current.Server.ClearError();
			response.Write("<html><h1>FEHLER</h1><p>Leider ist ein Fehler aufgetreten. Bitte versuchen Sie es später erneut.</p>");

			if (handledException != null && _showErrorDetaíls)
			{
				response.Write("<h2>Behandelter Fehler</h2>");
				response.Write(String.Format("<p>{0}</p>", handledException.Message));
				response.Write(String.Format("<pre>{0}</pre>", handledException.StackTrace));
			}

			if (exception != null && _showErrorDetaíls)
			{
				response.Write("<h2>Fehler im ErrorHandling</h2>");
				response.Write(String.Format("<p>{0}</p>", message));
				response.Write(String.Format("<p>{0}</p>", exception.Message));
				response.Write(String.Format("<pre>{0}</pre>", exception.StackTrace));
			}

			HttpContext.Current.ApplicationInstance.CompleteRequest();
		}

		#endregion
	}
}
