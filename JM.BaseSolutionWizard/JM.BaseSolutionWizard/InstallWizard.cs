using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TemplateWizard;
using EnvDTE;
using System.IO;
using WindowsFormsApplication1;
using System.Linq;

namespace JM.BaseSolutionWizard
{
    public class InstallWizard : IWizard
    {
        public void BeforeOpeningFile(EnvDTE.ProjectItem projectItem)
        {
            //throw new NotImplementedException();
        }

        public void ProjectFinishedGenerating(EnvDTE.Project project)
        {
            //throw new NotImplementedException();
        }

        public void ProjectItemFinishedGenerating(EnvDTE.ProjectItem projectItem)
        {
            //throw new NotImplementedException();
        }

        public void RunFinished()
        {
            //var c = new EnvDTE.DTEClass;
            //c.Solution.
        }

        public void RunStarted(object automationObject, Dictionary<string, string> replacementsDictionary, WizardRunKind runKind, object[] customParams)
        {
            FrmWizard frmWizard = new FrmWizard(GetSolutionName(), GetSolutionRootPath());
            frmWizard.ShowDialog();
            var transformationFiles = frmWizard.RenderedFiles;

            transformationFiles
                .ToList()
                .ForEach(f => AddFileToSolutionFolder(f));
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
            throw new NotImplementedException();
        }

        /// <summary>
        /// Liefert den 
        /// </summary>
        /// <returns></returns>
        private string GetSolutionName()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filePath">Z.B. C:\Dev\NeueSolution\Solution Files\Environments\Dev\web.config</param>
        /// <remarks>Erstellt den Solution Folder falls nicht vorhanden. Auch rekursiv. </remarks>
        private void AddFileToSolutionFolder(string filePath)
        {

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
