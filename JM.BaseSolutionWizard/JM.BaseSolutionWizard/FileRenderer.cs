using Mustache;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsApplication1;

namespace JM.BaseSolutionWizard
{
    public class FileRenderer
    {
        public void RenderFiles(
            string format,
            string folderRoot,
            IEnumerable<EnvironmentViewModel> environments)
        {
            FormatCompiler compiler = new FormatCompiler();
            Generator generator = compiler.Compile(format);

            var fileSource =
                environments
                .Select(en =>
                    new
                    {
                        FileName = en.EnvironmentName + ".config",
                        FolderName = Path.Combine(folderRoot, "Environments" ,en.EnvironmentName),
                        TemplateSource = new EnvironmentTemplateSource
                        {
                            DefaultConnectionString = en.StandardConnectionString,
                            PiranhaConnectionString = en.AdminConnectionString,
                            LoggingConnectionString = en.LoggingConnectionString,
                            //wenn nicht local config ist
                            IsRelease = !en.IsLocal
                        }
                    })
                .ToList();

            var notExistingEnvironmentFolders =
                fileSource
                .Select(d => d.FolderName)
                .Distinct()
                .Where(folderName => !Directory.Exists(folderName))
                .ToList();

            notExistingEnvironmentFolders.ForEach(folderName =>
                Directory.CreateDirectory(folderName));

            fileSource.ForEach(
                item =>
                {
                    string result = generator.Render(item.TemplateSource);
                    var filePath = Path.Combine(item.FolderName, item.FileName);
                    File.WriteAllText(filePath, result);
                });
        }
    }
}
