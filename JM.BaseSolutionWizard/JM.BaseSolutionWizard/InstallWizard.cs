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
        private IEnumerable<string> _transformationFiles;
        _DTE _dte;
        private Dictionary<string, string> _replacementsDictionary;
        private const string SOLUTIONNAME = "";
        private const string SOLUTIONPATH = "";

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
            _transformationFiles.ToList().ForEach(f => AddFileToSolutionFolder(f));
        }

        public void RunStarted(object automationObject, Dictionary<string, string> replacementsDictionary, WizardRunKind runKind, object[] customParams)
        {
            _dte = automationObject as _DTE;
            _replacementsDictionary = replacementsDictionary;

            var frmWizard = new FrmWizard(GetSolutionRootPath());
            frmWizard.ShowDialog();
            _transformationFiles = frmWizard.RenderedFiles;
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
            return _replacementsDictionary[SOLUTIONPATH];
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filePath">Z.B. C:\Dev\NeueSolution\Solution Files\Environments\Dev\web.config</param>
        /// <remarks>Erstellt den Solution Folder falls nicht vorhanden. Auch rekursiv. </remarks>
        private void AddFileToSolutionFolder(string filePath)
        {
            if (File.Exists(filePath))
            {
                var solutionPath = GetSolutionRootPath();
                var virtualPath = filePath.Replace(solutionPath, "");
                var directories = virtualPath.Split('/');
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
