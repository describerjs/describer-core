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
                    _fileManager.GetFilestreamFromTemplate("DbCreateScript.MTemplate")); // ToDo: Template

            frmWizard.ShowDialog();
            
            //hier werden die Confis zu den zugehörigen Anwendungen hinzugefügt
            var pSolutionFiles = _fileManager.AddDirectoryToProject(Path.Combine(_fileManager.SolutionRootPath, SOLUTIONFILESFOLDER));

            //hier werden dateien und orders zu den Solutionpath hinzugefügt
            AddFilesFromTemplate(pSolutionFiles);
            
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
        /// <param name="project"></param>
        private void AddFilesFromTemplate(Project project)
        {
            var templatePath = _fileManager.TemplateDirectory;
            _fileManager.AddFileToProject(Path.Combine(templatePath, "Settings.StyleCop"), project);
            _fileManager.AddFileToProject(Path.Combine(templatePath, "NuGet.Config"), project);
            _fileManager.AddFileToProject(Path.Combine(templatePath, "EditStyleCopSettings.cmd"), project);
            _fileManager.AddDirectoryToProject(Path.Combine(templatePath, "StyleCop"), project);
        }
    }
}