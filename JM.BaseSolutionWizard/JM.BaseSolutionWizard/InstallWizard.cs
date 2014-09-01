using System.Collections.Generic;
using Microsoft.VisualStudio.TemplateWizard;
using EnvDTE;
using System.IO;
using WindowsFormsApplication1;

namespace JM.BaseSolutionWizard
{
    public class InstallWizard : IWizard
    {
        private ProjectFileManager _fileManager;

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
                    _fileManager.SolutionName,
                    _fileManager.SolutionRootPath,
                    _fileManager.GetFilestreamFromTemplate("Web.config.MTemplate"),
                    _fileManager.GetFilestreamFromTemplate("DbCreateScript.MTemplate"),
                    null);

            frmWizard.ShowDialog();
            
            //hier werden die Confis zu den zugehörigen Anwendungen hinzugefügt
            var pSolutionFiles = _fileManager.AddDirectoryToProject(Path.Combine(_fileManager.SolutionRootPath, SOLUTIONFILESFOLDER));

            //hier werden dateien und orders zu den "Solution Files" Order hinzugefügt
            AddFilesFromTemplateToSolution(pSolutionFiles);
            
            //schließ alle geöffnete Dokumenten
            _fileManager.CloseAllOpenedDocuments();
        }

        public void RunStarted(
            object automationObject, 
            Dictionary<string, string> replacementsDictionary, 
            WizardRunKind runKind, 
            object[] customParams)
        {
            _fileManager = new ProjectFileManager(automationObject as _DTE, replacementsDictionary, customParams[0] as string);
        }

        public bool ShouldAddProjectItem(string filePath)
        {
            return true;
        }
        
        /// <summary>
        /// fügt wichtige Dateien aus dem Template zu dem Project hinzu;
        /// </summary>
        /// <param name="project">das Projekt wo die Dateien hinzugefügt werden müssen</param>
        private void AddFilesFromTemplateToSolution(Project project)
        {
            var templatePath = _fileManager.TemplateDirectory;
            var solutionPath = _fileManager.SolutionRootPath;

            //erst werden die Dateien in Projektordner kopiert
            _fileManager.CopyFile(templatePath, solutionPath, "Settings.StyleCop");
            _fileManager.CopyFile(templatePath, solutionPath, "NuGet.Config");
            _fileManager.CopyFile(templatePath, solutionPath, "EditStyleCopSettings.cmd");
            _fileManager.CopyDirectory(templatePath, solutionPath, "StyleCop");

            //dann werden die Dateien zum Projekt hinzugefügt
            _fileManager.AddFileToProject(Path.Combine(solutionPath, "Settings.StyleCop"), project);
            _fileManager.AddFileToProject(Path.Combine(solutionPath, "NuGet.Config"), project);
            _fileManager.AddFileToProject(Path.Combine(solutionPath, "EditStyleCopSettings.cmd"), project);
            _fileManager.AddDirectoryToProject(Path.Combine(solutionPath, "StyleCop"), project);
        }
    }
}