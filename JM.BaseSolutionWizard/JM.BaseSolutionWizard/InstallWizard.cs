using System.Collections.Generic;
using Microsoft.VisualStudio.TemplateWizard;
using EnvDTE;
using EnvDTE80;
using System.IO;
using WindowsFormsApplication1;
using System.Linq;

namespace JM.BaseSolutionWizard
{
    public class InstallWizard : IWizard
    {
        private _DTE _dte;
        private Dictionary<string, string> _replacementsDictionary;
        private const string PROJECTNAME = "$projectname$";
        private const string SOLUTIONDIRECTORY = "$solutiondirectory$";
        private const string DESTINATIONDIRECTORY = "$destinationdirectory$";
        private string _templatePath;

        /// <summary>
        /// z.b. C:\Dev\NeueSolution\Solution Files\
        /// </summary>
        private const string SOLUTIONFILESFOLDER = "Solution Files";

        public void BeforeOpeningFile(ProjectItem projectItem)
        {
            //throw new NotImplementedException();
        }

        public void ProjectFinishedGenerating(Project project)
        {
            //throw new NotImplementedException();
        }

        public void ProjectItemFinishedGenerating(ProjectItem projectItem)
        {
            //throw new NotImplementedException();
        }

        public void RunFinished()
        {
            var frmWizard = 
                new FrmWizard(
                    GetSolutionName(), 
                    GetSolutionRootPath(), 
                    GetFilestreamFromTemplate("Web.config.MTemplate"),
                    GetFilestreamFromTemplate("DbCreateScript.MTemplate")); // ToDo: Template

            frmWizard.ShowDialog();

            var solutionFilesPath = Path.Combine(GetSolutionRootPath(), SOLUTIONFILESFOLDER);

            if (Directory.Exists(solutionFilesPath))
            {
                var solution = (Solution2)_dte.Solution;
                var pSolutionFiles = solution.AddSolutionFolder(SOLUTIONFILESFOLDER);

                var directoryInfo = new DirectoryInfo(solutionFilesPath);

                AddFilesToSolutionFolder(pSolutionFiles, directoryInfo.GetFiles());
                AddDirectoriesToSolutionFolder(pSolutionFiles, directoryInfo.GetDirectories());

                foreach (Window window in _dte.Windows)
                {
                    if(window.Type == vsWindowType.vsWindowTypeDocument)
                        window.Close();
                }
            }
        }

        public void RunStarted(
            object automationObject, 
            Dictionary<string, string> replacementsDictionary, 
            WizardRunKind runKind, 
            object[] customParams)
        {
            _dte = automationObject as _DTE;
            _replacementsDictionary = replacementsDictionary;
            _templatePath = customParams[0] as string;
        }

        public bool ShouldAddProjectItem(string filePath)
        {
            return true;
        }

        /// <summary>
        /// Liefert den Pfad der erstellten Solution.
        /// </summary>
        /// <returns></returns>
        private string GetSolutionRootPath()
        {
            return _replacementsDictionary[SOLUTIONDIRECTORY];
        }

        /// <summary>
        /// Liefert den 
        /// </summary>
        /// <returns></returns>
        private string GetSolutionName()
        {
            return _replacementsDictionary[PROJECTNAME];
        }

        private void AddDirectoriesToSolutionFolder(Project project, IEnumerable<DirectoryInfo> directories)
        {
            if (directories != null && directories.Any())
            {
                var solutionFolder = (SolutionFolder)project.Object;

                foreach (var directory in directories)
                {
                    var subProject = solutionFolder.AddSolutionFolder(directory.Name);

                    AddFilesToSolutionFolder(subProject, directory.GetFiles());
                    AddDirectoriesToSolutionFolder(subProject, directory.GetDirectories());
                }
            }
        }
        private void AddFilesToSolutionFolder(Project project, IEnumerable<FileInfo> files)
        {
            if (files != null && files.Any())
            {
                foreach (var file in files)
                {
                    project.ProjectItems.AddFromFile(file.FullName);
                }
            }
        }

        /// <summary>
        /// Liefert einen lesenden Filestream auf eine Datei, die sich in der template.zip befindet.
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        /// <remarks>Die Datei muss sich im Root-Verzeichnis des Templates befinden.</remarks>
        private Stream GetFilestreamFromTemplate(string filename)
        {
            var templateInfo = new FileInfo(_templatePath);
            var tempRoot = templateInfo.DirectoryName;
            var filePath = Path.Combine(tempRoot, filename);

            if (File.Exists(filePath))
            {
                return new FileStream(filePath, FileMode.Open, FileAccess.ReadWrite);
            }

            return null;
        }
    }
}
