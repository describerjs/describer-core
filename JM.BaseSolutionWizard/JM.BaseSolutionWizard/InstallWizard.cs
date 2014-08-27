using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
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
        /// <summary>
        /// z.b. C:\Dev\NeueSolution\Solution Files\
        /// </summary>
        private const string SOLUTIONFILESFOLDER = "SolutionFiles";

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
            var frmWizard = new FrmWizard(GetSolutionName(), GetSolutionRootPath(), GetFilestreamFromTemplate("Web.config.MTemplate"));
            frmWizard.ShowDialog();

            var solutionFilesPath = Path.Combine(SOLUTIONDIRECTORY, SOLUTIONFILESFOLDER);
            if (Directory.Exists(solutionFilesPath))
            {
                var solution = (Solution2)_dte.Solution;
                var pSolutionFiles = solution.AddSolutionFolder(SOLUTIONFILESFOLDER);

                var files = Directory.GetFiles(solutionFilesPath);
                AddFilesToSolutionFolder(pSolutionFiles, files);

                var directories = Directory.GetDirectories(solutionFilesPath);
                AddDirectoriesToSolutionFolder(pSolutionFiles, directories);
        }
        }

        public void RunStarted(object automationObject, Dictionary<string, string> replacementsDictionary, WizardRunKind runKind, object[] customParams)
        {
            _dte = automationObject as _DTE;
            _replacementsDictionary = replacementsDictionary;
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

        private void AddDirectoriesToSolutionFolder(Project project, string[] directories)
        {
            if (directories != null && directories.Any())
            {
                var solutionFolder = (SolutionFolder)project.Object;
                foreach (var directory in directories)
        {
                    var directoryName = directory.Replace(SOLUTIONDIRECTORY, string.Empty);
                    var subProject = solutionFolder.AddSolutionFolder(directoryName);

                    var files = Directory.GetFiles(directoryName);
                    AddFilesToSolutionFolder(subProject, files);

                    var subDirectories = Directory.GetDirectories(directoryName);
                    AddDirectoriesToSolutionFolder(subProject, subDirectories);
                }
            }
        }
        private void AddFilesToSolutionFolder(Project project, string[] files)
        {
            if (files != null && files.Any())
            {
                foreach (var file in files)
                {
                    project.ProjectItems.AddFromFile(file);
                }
            }
        }

        /// <summary>
        /// Liefert einen lesenden Filestream auf eine Datei, die sich in der template.zip befindet.
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        /// <remarks>Die Datei muss sich im Root-Verzeichnis des Templates befinden.</remarks>
        private FileStream GetFilestreamFromTemplate(string filename)
        {
            throw new NotImplementedException();
        }
    }
}
