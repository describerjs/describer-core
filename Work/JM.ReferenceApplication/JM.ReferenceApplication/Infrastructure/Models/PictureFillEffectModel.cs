using Piranha.Extend.Regions;

namespace JM.ReferenceApplication.Infrastructure.Models
{
	public class PictureFillEffectModel
	{
		//////////////////////////////////////////////////////////////////////////////////////
		#region private fields

		private string _effectKey;

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region public fields

		/// <summary>
		/// ImageRegion von Piranha
		/// </summary>
		public ImageRegion Image { get; set; }
		
		/// <summary>
		/// Name des Effekts/der,Effekte, die dem Bild zugeordnet sind
		/// </summary>
		public string EffectKey
		{
			get { return _effectKey ?? (_effectKey = ""); }
			set { _effectKey = value; }
		}

		/// <summary>
		/// Parallax-Effekt ist eingebaut
		/// - prüft den Effektkey
		/// </summary>
		public bool EnableParallax { get { return EffectKey == "parallax"; }}
		
		/// <summary>
		/// Gyrposkop-Effekt ist eingebaut
		/// - prüft den Effektkey
		/// </summary>
		public bool EnableGyroscope { get { return EffectKey == "gyroscope"; } }

		/// <summary>
		/// Parallax- und Gyroskop-Effekt ist eingebaut
		/// - prüft den Effektkey
		/// </summary>
		public bool EnableParallaxAndGyroscope { get { return EffectKey == "parallax_gyroscope"; } }

		/// <summary>
		/// Stärke des Parallax-Effekt als Kommazahl zwischen 1 und 3
		/// </summary>
		public float ParallaxEffectStrength { get; set; }

		/// <summary>
		/// Bestimmt ob das Element ausgeblendet werden soll
		/// </summary>
		public bool Hide { get; set; }

		#endregion

		//////////////////////////////////////////////////////////////////////////////////////
		#region public methods

		/// <summary>
		/// Erzeugt eine neue Instanz des Models und füllt sie mit den Daten aus dem Teasermodel
		/// </summary>
		/// <param name="model">Instanz der Klasse/Region Teaser</param>
		/// <returns>PictureFillEffectModel</returns>
		public static PictureFillEffectModel Get(Teaser model)
		{
			return new PictureFillEffectModel
			{
				Image = model.Image,
				EffectKey = model.ImageEffect,
				ParallaxEffectStrength = model.ParallaxValue,
				Hide = model.Hide
			};
		}

		/// <summary>
		/// Erzeugt eine neue Instanz des Models und füllt sie mit den Daten aus dem Teasermodel
		/// </summary>
		/// <param name="model">Instanz der Klasse/Region AnimatedImage</param>
		/// <returns>PictureFillEffectModel</returns>
		public static PictureFillEffectModel Get(AnimatedImage model)
		{
			return new PictureFillEffectModel
			{
				Image = model.Image,
				EffectKey = model.ImageEffect,
				ParallaxEffectStrength = model.ParallaxValue,
				Hide = model.Hide
			};
		}

		#endregion
	}
}