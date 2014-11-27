using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace joinmedia.Infrastructure
{
	public class UploadManager
	{
		private long _imageQuality = 80;
		private string _sourceImagesFilePath = @"C:\www\JM.Foundation\Work\joinmedia\upload";

		#region File upload stuff

		public UploadResult HandleFileUploads()
		{
			const string imageFieldName = "file";
			const string imageFallbackFieldName = "fallbackfile";

			var result = new UploadResult
			{
				UploadMode = UploadMode.None,
				Filename = string.Empty,
				Uploaded = false,
				IsValid = false
			};

			var request = HttpContext.Current.Request;
			if (request[imageFieldName] != null)
				result.UploadMode = UploadMode.Ajax;

			if (request.Files[imageFallbackFieldName] != null)
				result.UploadMode = UploadMode.Fallback;


			switch (result.UploadMode)
			{
				case UploadMode.None:
					return result;

				case UploadMode.Ajax:
					result.Uploaded = request[imageFieldName] != null;
					if (result.Uploaded)
						result.Filename = HandleFileUpload(request[imageFieldName]);
					break;

				case UploadMode.Fallback:
					result.Uploaded = request.Files[imageFallbackFieldName] != null && request.Files[imageFallbackFieldName].ContentLength > 0;
					if (result.Uploaded)
						result.Filename = HandleFileUpload(request.Files[imageFallbackFieldName]);
					break;
			}
			result.IsValid = !string.IsNullOrEmpty(result.Filename);

			return result;
		}

		/// <summary>
		/// Saves the uploaded file
		/// </summary>
		/// <param name="fileBase"></param>
		/// <returns>A filename in the temp storage or an empty string on error</returns>
		private string HandleFileUpload(HttpPostedFile fileBase)
		{
			var extension = GetExtensionByMimeType(fileBase.ContentType);
			if (string.IsNullOrEmpty(extension))
				return string.Empty;
			try
			{
				var newfilename = String.Format("{0}.{1}", HashingUtility.GetGuid(), extension);
				var newfilepath = Path.Combine(_sourceImagesFilePath, newfilename);
				fileBase.SaveAs(newfilepath);
				if (ValidateImage(newfilepath))
					return newfilename;

				if (File.Exists(newfilepath))
					File.Delete(newfilepath);
			}
			catch (Exception ex)
			{
				//
			}
			return string.Empty;
		}

		/// <summary>
		/// Saves the uploaded file
		/// </summary>
		/// <param name="dataurl"></param>
		/// <returns>A filename in the temp storage or an empty string on error</returns>
		private string HandleFileUpload(string dataurl)
		{
			try
			{
				var data = dataurl.Substring(dataurl.IndexOf(",") + 1);
				var newfile = Convert.FromBase64String(data);
				var extension = GetExtensionByMimeType(dataurl.Substring(0, dataurl.IndexOf(";")).Replace("data:", ""));
				if (string.IsNullOrEmpty(extension))
					return string.Empty;

				var newfilename = String.Format("{0}.{1}", HashingUtility.GetGuid(), extension);
				var newfilepath = Path.Combine(_sourceImagesFilePath, newfilename);
				File.WriteAllBytes(newfilepath, newfile);
				if (ValidateImage(newfilepath))
					return newfilename;

				if (File.Exists(newfilepath))
					File.Delete(newfilepath);
			}
			catch (Exception ex)
			{
				//
			}
			return string.Empty;
		}

		#endregion

		/// <summary>
		/// Gets the file extension by its mime type. Returns an empty string on non-images
		/// </summary>
		/// <param name="mimeType"></param>
		/// <returns></returns>
		private static string GetExtensionByMimeType(string mimeType)
		{
			if (string.IsNullOrEmpty(mimeType))
				return string.Empty;

			var subtype = mimeType.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries).Last().ToLower();
			switch (subtype)
			{
				case "jpeg":
					return "jpg";
				case "gif":
				case "png":
				case "jpg":
					return subtype;
				default:
					return string.Empty;
			}
		}

		/// <summary>
		/// Gets a mime type for a file
		/// </summary>
		/// <param name="name"></param>
		/// <returns></returns>
		public static string GetMimeTypeByName(string name)
		{
			var extension = name.Split('.').Last().ToLower();
			switch (extension)
			{
				case "jpg":
				case "jpeg":
					return "image/jpeg";
				case "gif":
				case "png":
					return "image/" + extension;
				default:
					return "application/octet-stream";
			}
		}

		/// <summary>
		/// Checks if the file is valid TODO
		/// </summary>
		/// <returns></returns>
		private bool ValidateImage(string filename)
		{
			return true;
		}
	}

	public enum UploadMode
	{
		/// <summary>
		/// No uploaded files found in the request
		/// </summary>
		None,

		/// <summary>
		/// Ajax upload
		/// </summary>
		Ajax,

		/// <summary>
		/// Fallback upload
		/// </summary>
		Fallback
	}

	public class UploadResult
	{
		public UploadMode UploadMode { get; internal set; }

		/// <summary>
		/// The filename in the source files storage, without path
		/// </summary>
		public string Filename { get; internal set; }

		/// <summary>
		/// True if the image was actually uploaded
		/// </summary>
		public bool Uploaded { get; internal set; }

		/// <summary>
		/// True, if the uploaded file is a valid image
		/// </summary>
		public bool IsValid { get; internal set; }
	}

	public class HashingUtility
	{
		private const string Map = "0123456789abcdefghijklmnopqrstuvwxyz";
		private static readonly int MapBase;
		private static readonly char[] MapArray;
		private static Random _random = new Random();
		private static readonly DateTime _epoch = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);

		static HashingUtility()
		{
			MapBase = Map.Length;
			MapArray = Map.ToArray();
		}

		/// <summary>
		/// Converts an integer into a base-36 string 
		/// </summary>
		/// <param name="value">value to convert, f.e 1534002484</param>
		/// <returns>base-36 string, f.e. pdazw4</returns>
		public static string ConvertToAlphaNumeric(int value)
		{
			var sb = new StringBuilder();
			do
			{
				var remainder = value % MapBase;
				sb.Insert(0, MapArray[remainder]);
				value = value / MapBase;
			} while (value > 0);
			return sb.ToString();
		}

		/// <summary>
		/// Converts a base-36 string to an integer
		/// </summary>
		/// <param name="value">base-36 string, f.e. pdazw4</param>
		/// <returns>integer value, f.e. 1534002484</returns>
		public static int ConvertFromAlphanumeric(string value)
		{
			var number = 0;
			try
			{
				var digits = value.ToLower().ToCharArray().Select(c => Map.IndexOf(c));
				foreach (var digit in digits)
				{
					number = number * MapBase + (digit == -1 ? 0 : digit);
				}
			}
			catch
			{
				return 0;
			}

			return number;
		}

		/// <summary>
		/// Gets a microtime value for the current time
		/// </summary>
		/// <returns></returns>
		public static long GetMicrotime()
		{
			return GetMicrotime(DateTime.Now);
		}

		/// <summary>
		/// Gets a microtime value for the specified timestamp
		/// </summary>
		/// <param name="timestamp">Date and time</param>
		/// <param name="randomMilliseconds">if true, the milliseconds get generated randomly</param>
		/// <returns></returns>
		public static long GetMicrotime(DateTime timestamp, bool randomMilliseconds = false)
		{
			var milliseconds = (timestamp - _epoch).TotalMilliseconds;
			if (randomMilliseconds)
			{
				milliseconds = (Math.Floor(milliseconds / 1000.0) + _random.NextDouble()) * 1000.0;
			}
			return Convert.ToInt64(milliseconds);
		}

		/// <summary>
		/// Converts microtime to DateTime value
		/// </summary>
		/// <param name="microtime"></param>
		/// <returns></returns>
		public static DateTime GetDateFromMicrotime(long microtime)
		{
			var milliseconds = Convert.ToDouble(microtime);
			var date = _epoch.AddMilliseconds(milliseconds).ToLocalTime();
			return date;
		}

		/// <summary>
		/// Random object
		/// </summary>
		public static Random RandomGenerator
		{
			get { return _random; }
		}

		/// <summary>
		/// Generates a new GUID value
		/// </summary>
		/// <returns></returns>
		public static string GetGuid()
		{
			var guid = Guid.NewGuid();
			return guid.ToString();
		}

		/// <summary>
		/// Generates a random deeplink value for the post
		/// </summary>
		/// <returns></returns>
		//public static int GetNewDeeplink()
		//{
		//	return RandomGenerator.Next(ApplicationConfiguration.DeeplinkStartValue, ApplicationConfiguration.DeeplinkEndValue);
		//}
	}
}
