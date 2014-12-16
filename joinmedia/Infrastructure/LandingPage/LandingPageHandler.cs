using joinmedia.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace joinmedia.Infrastructure.LandingPage
{
	public class LandingPageHandler
	{
		public static Dictionary<string, LandingPageInfo> LandingPages
		{
			get { return Configuration.LandingPages; }
		}
		
		public void SendNotificationEmail(string message, string emailTo, string previewLink = "")
		{
			// Send an email notification when the real visitor comes in
			var page = HttpContext.Current.Request.RawUrl;
			var subject = "Landing page visit: " + page;
			var sb = new StringBuilder();
			if (!string.IsNullOrEmpty(previewLink))
			{
				sb.AppendFormat("====================\r\nLanding page preview link: {0}\r\n====================\r\n", previewLink);
			}
			sb.AppendFormat("Page: {0}\r\n", page);
			sb.AppendFormat("Date: {0}\r\n", DateTime.Now);
			sb.AppendFormat("IP Address: {0}\r\n", CurrentRequest.IPAddress);
			sb.AppendFormat("Referrer: {0}\r\n", HttpContext.Current.Request.UrlReferrer == null ? string.Empty : HttpContext.Current.Request.UrlReferrer.ToString());
			sb.AppendFormat("UserAgent: {0}\r\n", HttpContext.Current.Request.UserAgent);

			if (!string.IsNullOrEmpty(message))
				sb.AppendFormat("Message: {0}\r\n", message);

			var body = sb.ToString();
			try
			{
				var email = new MailMessage(
					Configuration.DefaultFrom,
					string.IsNullOrEmpty(emailTo) ? Configuration.LandingPageVisitsTo : emailTo,
					subject,
					body
				);

				var client = new SmtpClient(Configuration.SmtpServer);

				client.Send(email);
			}
			catch { }
		}

		public void TrackRealVisitor(string deeplink)
		{
			try
			{
				var password = "43BA07D29BD3403A804015D33C6DAC44";
				var url = "http://pm.ansicht.joinmedia.de";

				var request = WebRequest.Create(url) as HttpWebRequest;
				request.Method = "POST";

				// Create POST data and convert it to a byte array.
				var postData = string.Format("d={0}&p={1}&i={2}&r={3}&a={4}", HttpUtility.UrlEncode(deeplink), password, HttpUtility.UrlEncode(CurrentRequest.IPAddress), HttpContext.Current.Request.UrlReferrer == null ? string.Empty : HttpUtility.UrlEncode(HttpContext.Current.Request.UrlReferrer.ToString()), HttpUtility.UrlEncode(HttpContext.Current.Request.UserAgent));
				var byteArray = Encoding.UTF8.GetBytes(postData);

				// Set the ContentType property of the WebRequest.
				request.ContentType = "application/x-www-form-urlencoded";

				request.CookieContainer = new CookieContainer();
				request.CookieContainer.Add(new Cookie("b5466b0c6fb741b59077d59b7d775891", "1", "/", ".pm.ansicht.joinmedia.de"));
				request.Headers["Authorization"] = "Basic SFRUUC1Vc2VyOnNrMTk0VCoj";

				// Set the ContentLength property of the WebRequest.
				request.ContentLength = byteArray.Length;

				// Get the request stream.
				var dataStream = request.GetRequestStream();

				// Write the data to the request stream.
				dataStream.Write(byteArray, 0, byteArray.Length);

				// Close the Stream object.
				dataStream.Close();

				// Get the response.
				var response = request.GetResponse();

				// Display the status.
				Console.WriteLine(((HttpWebResponse)response).StatusDescription);

				// Get the stream containing content returned by the server.
				dataStream = response.GetResponseStream();

				// Open the stream using a StreamReader for easy access.
				var reader = new StreamReader(dataStream);

				// Read the content.
				string responseFromServer = reader.ReadToEnd();

				// Display the content.
				Console.WriteLine(responseFromServer);

				// Clean up the streams.
				reader.Close();
				dataStream.Close();
				response.Close();

				SendNotificationEmail(responseFromServer, "fh@joinmedia.de");
			}
			catch (Exception e)
			{
				SendNotificationEmail(e.Message, "fh@joinmedia.de");
			}
		}
	}
}