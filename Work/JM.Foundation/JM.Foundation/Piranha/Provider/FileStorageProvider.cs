
namespace JM.Foundation.Piranha.Provider
{
    public class FileStorageProvider : global::Piranha.IO.LocalMediaProvider
    {
        public FileStorageProvider()
			: base(@"\\172.30.106.1\PiranhaMedia\Content", @"\\172.30.106.1\PiranhaMedia\Uploads")
        {
        }
    }
}
