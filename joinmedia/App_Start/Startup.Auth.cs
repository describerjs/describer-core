using joinmedia.Infrastructure.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;
using System;

namespace joinmedia
{
	public partial class Startup
	{
		// Weitere Informationen zum Konfigurieren der Authentifizierung finden Sie unter "http://go.microsoft.com/fwlink/?LinkId=301864".
		public void ConfigureAuth(IAppBuilder app)
		{
			//// Konfigurieren des db-Kontexts und des Benutzer-Managers für die Verwendung einer einzelnen Instanz pro Anforderung.
			//app.CreatePerOwinContext(ApplicationDbContext.Create);
			//app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);

			//// Anwendung für die Verwendung eines Cookies zum Speichern von Informationen für den angemeldeten Benutzer aktivieren
			//// und ein Cookie zum vorübergehenden Speichern von Informationen zu einem Benutzer zu verwenden, der sich mit dem Anmeldeanbieter eines Drittanbieters anmeldet.
			//// Konfigurieren des Anmeldecookies.
			//app.UseCookieAuthentication(new CookieAuthenticationOptions
			//{
			//	AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
			//	LoginPath = new PathString("/Account/Login"),
			//	Provider = new CookieAuthenticationProvider
			//	{
			//		OnValidateIdentity = SecurityStampValidator.OnValidateIdentity<ApplicationUserManager, ApplicationUser>(
			//			validateInterval: TimeSpan.FromMinutes(30),
			//			regenerateIdentity: (manager, user) => user.GenerateUserIdentityAsync(manager))
			//	}
			//});

			//app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

			// Auskommentierung der folgenden Zeilen aufheben, um die Anmeldung mit Anmeldeanbietern von Drittanbietern zu ermöglichen
			// app.UseMicrosoftAccountAuthentication(
			//    clientId: "",
			//    clientSecret: "");

			// app.UseTwitterAuthentication(
			//   consumerKey: "",
			//   consumerSecret: "");

			// app.UseFacebookAuthentication(
			//   appId: "",
			//   appSecret: "");

			// app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions()
			// {
			//     ClientId = "",
			//     ClientSecret = ""
			// });
		}
	}
}