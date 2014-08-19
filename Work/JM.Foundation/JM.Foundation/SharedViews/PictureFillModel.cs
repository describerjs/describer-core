namespace JM.Foundation.SharedViews
{
	public class PictureFillModel
	{
		/// <summary>
		/// Bildname ohne Größe/Typ, zB "Landschaft" für das Bild "Landschaft-1240-450.webp"
		/// </summary>
		public string ImageName { get; set; }

		/// <summary>
		/// Alt-Text
		/// </summary>
		public string Alt { get; set; }

		/// <summary>
		/// Default Höhe des Bildes (entspricht Desktopgröße)
		/// </summary>
		public int Height { get; set; }

		/// <summary>
		/// Default Breite des Bildes (entspricht Desktopgröße)
		/// </summary>
		public int Width { get; set; }

		/// <summary>
		/// Höhe für Tablets
		/// </summary>
		public int HeightTablet { get; set; }

		/// <summary>
		/// Breite für Tablets
		/// </summary>
		public int WidthTablet { get; set; }

		/// <summary>
		/// Höhe für Mobile
		/// </summary>
		public int HeightMobile { get; set; }

		/// <summary>
		/// Breite für Mobile
		/// </summary>
		public int WidthMobile { get; set; }

		/// <summary>
		/// Sammlung für weitere Html-Attribute
		/// </summary>
		public object Attributes { get; set; }
	}
}