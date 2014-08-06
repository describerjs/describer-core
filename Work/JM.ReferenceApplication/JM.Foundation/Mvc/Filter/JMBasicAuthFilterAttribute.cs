using JM.Foundation.Configuration;
using System;
using System.Web.Mvc;

namespace JM.Foundation.Mvc.Filter
{
	public class JMBasicAuthFilterAttribute : ActionFilterAttribute
    {
		private Config _config = ApplicationConfiguration.GetConfigSection<Config>("JM.Foundation");

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //Validate the request
            if (ValidRequest(filterContext)) { return; }
            //Get current response
            var res = filterContext.HttpContext.Response;
            //Return authorization failed
            res.StatusCode = 401;
            //Add basic authorization header
            res.AddHeader("WWW-Authenticate", String.Format("Basic realm=\"{0}\"", _config.JMBasicAuthenticationFilter.AreaName));
            //Stop current request
            res.End();
        }

        private bool ValidRequest(ActionExecutingContext filterContext)
        {
            //Try to validate user
            try
            {
	            //Get request header
                string authorization = filterContext.HttpContext.Request.Headers["Authorization"];
                //Check for missing item
                if (string.IsNullOrEmpty(authorization)) { return false; }
                //Check for valid length
                if (authorization.Length < 6) { return false; }
                //Delete basic starting value and convert
                var bytes = Convert.FromBase64String(authorization.Substring(6));
                //Convert back to ascii
                authorization = System.Text.ASCIIEncoding.ASCII.GetString(bytes);
                //Split by separator
                var cred = authorization.Split(':');
                //Check for available items
                if (cred.Length < 2) { return false; }
                //Compare username value
				if (!cred[0].Equals(_config.JMBasicAuthenticationFilter.Username)) { return false; }
                //Compare password value
				if (!cred[1].Equals(_config.JMBasicAuthenticationFilter.Password)) { return false; }
                //Return success authorization
                return true;
            }
            catch
            {
                //Return failure
                return false;
            }
        }
    }
}
