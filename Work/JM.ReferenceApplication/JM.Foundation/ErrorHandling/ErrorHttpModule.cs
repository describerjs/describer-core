using System;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using JM.Foundation.Configuration;

namespace JM.Foundation.ErrorHandling
{
    /// <summary>
    /// HttpModul zum abfangen aller Exceptions aus der Webanwendung.
    /// Stellt Logging bereit und bereitet die Darstellung von Fehlerseiten vor.
    /// </summary>
    public class ErrorHttpModule : IHttpModule
    {
        //////////////////////////////////////////////////////////////////////////////////////
        #region private Member

        private static string s_errorControllerRouteName;
        private static string s_errorControllerAction;
        private static bool s_showErrorDetails;

        #endregion

        //////////////////////////////////////////////////////////////////////////////////////
        #region public Methods

        public void Init(HttpApplication context)
        {
            var config = ApplicationConfiguration.GetConfigSection<Config>("JM.Foundation");

            if (config.ErrorHttpModule.Enabled)
            {
                context.Error += Application_Error;
            }

            s_errorControllerRouteName = config.ErrorHttpModule.ErrorPageController;
            s_errorControllerAction = config.ErrorHttpModule.ErrorPageAction;
            s_showErrorDetails = config.ErrorHttpModule.ShowErrorDetails;
        }

        public void Dispose()
        { 
        }

        #endregion

        //////////////////////////////////////////////////////////////////////////////////////
        #region private Methods

        /// <summary>
        /// Diese Methode wird beim "Application_Error"-Event der global.asax aufgerufen,
        /// loggt die Exception und zeigt dem Besucher der Seite dann eine qualifizierte Seite an.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private static void Application_Error(object sender, EventArgs e)
        {
            // Exception abhholen
            var exception = HttpContext.Current.Server.GetLastError();

            if (exception is HttpUnhandledException)
            {
                exception = exception.InnerException ?? exception;
            }

            var httpException = exception as HttpException;

            // Exception loggen
            LogException(exception);

            var httpStatusCode = httpException != null
                ? httpException.GetHttpCode()
                : (int)HttpStatusCode.InternalServerError;

            var exceptionMessage = exception.Message;

            // Wenn der Fehler im Fehlercontroller passiert wollen wir natürlich keinen Loop
            var p = HttpContext.Current.Request.Path;
            
            if (HttpContext.Current.Request.Path.ToLower().StartsWith("/" + s_errorControllerRouteName.ToLower() + "/"))
            {
                HandleErrorHandlingException(
                    "Fehler bei der Erzeugung der Fehlerseite.",
                    HttpContext.Current.Server.GetLastError());
            }

            // Prüfen ob es sich um eine JMException handelt, in dem Fall auf Redirect und UserMessage prüfen
            var jmException = exception as JMApplicationException;

            if (jmException != null)
            {
                if (jmException.HasRedirectUrl)
                {
                    HttpContext.Current.Server.ClearError();
                    HttpContext.Current.Response.Redirect(jmException.RedirectUrl);
                    return;
                }

                if (jmException.HasUserMessage)
                {
                    exceptionMessage = jmException.UserMessage;
                }
            }

            // Fehlerseite anzeigen, falls das fehlschlägt minimale Fehlerseite anzeigen
            try
            {
                var routeData = new RouteData();

                routeData.Values.Add("controller", s_errorControllerRouteName);
                routeData.Values.Add("action", s_errorControllerAction);
                routeData.Values.Add("statusCode", httpStatusCode);
                routeData.Values.Add("message", exceptionMessage);

                var requestContext = new RequestContext(new HttpContextWrapper(HttpContext.Current), routeData);
                var controllerFactory = ControllerBuilder.Current.GetControllerFactory();
                var controller = controllerFactory.CreateController(requestContext, s_errorControllerRouteName);

                controller.Execute(requestContext);

                HttpContext.Current.Server.ClearError();
            }
            catch (Exception renderException)
            {
                HandleErrorHandlingException("Fehler bei der Erzeugung der Fehlerseite.", httpException, renderException);
            }
        }

        /// <summary>
        /// Wenn bei der Anzeige der Fehlerseite etwas schiefgegangen ist wird hier eine reduzierte Fehlerseite direkt in den Responsestream geschrieben.
        /// </summary>
        /// <param name="message">Nachricht für den Besucher der Seite</param>
        /// <param name="handledException">Ursprüngliche behandelte Exception</param>
        /// <param name="exception">Exception beim Erzeugen der Fehlerseite</param>
        private static void HandleErrorHandlingException(string message, Exception handledException, Exception exception = null)
        {
            var response = HttpContext.Current.Response;

            response.ClearHeaders();
            response.ClearContent();
            response.StatusCode = (int)HttpStatusCode.InternalServerError;
            HttpContext.Current.Server.ClearError();
            response.Write("<html><h1>FEHLER</h1><p>Leider ist ein Fehler aufgetreten. Bitte versuchen Sie es später erneut.</p>");

            if (handledException != null && s_showErrorDetails)
            {
                response.Write("<h2>Behandelter Fehler</h2>");
                response.Write(string.Format("<p>{0}</p>", handledException.Message));
                response.Write(string.Format("<pre>{0}</pre>", handledException.StackTrace));
            }

            if (exception != null && s_showErrorDetails)
            {
                response.Write("<h2>Fehler im ErrorHandling</h2>");
                response.Write(string.Format("<p>{0}</p>", message));
                response.Write(string.Format("<p>{0}</p>", exception.Message));
                response.Write(string.Format("<pre>{0}</pre>", exception.StackTrace));
            }

            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }

        /// <summary>
        /// Loggt die übergebene Exception
        /// </summary>
        /// <param name="exception">Exception</param>
        private static void LogException(Exception exception)
        {
            JMEventSourceBase.Log.Exception(exception);
        }

        /// <summary>
        /// Loggt die übergebene Exception
        /// </summary>
        /// <param name="exception">Exception</param>
        private static void LogException(JMApplicationException exception)
        {
            // ToDo: Das ganze Konstrukt ist noch wackelig :)
            if (!exception.IsLogged)
            {
                JMEventSourceBase.Log.Exception(exception);
            }
        }

        #endregion
    }
}
