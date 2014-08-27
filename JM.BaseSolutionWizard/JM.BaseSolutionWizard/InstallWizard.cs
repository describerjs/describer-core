﻿using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TemplateWizard;
using EnvDTE;
using System.IO;

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
            //throw new NotImplementedException();
            System.Windows.Forms.MessageBox.Show("Test");
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
        /// 
        /// </summary>
        /// <param name="filePath">Z.B. C:\Dev\NeueSolution</param>
        /// <param name="solutionFolder">Z.B. "Solution Files\Environments\Dev</param>
        /// <remarks>Erstellt den Solution Folder falls nicht vorhanden. Auch rekursiv.</remarks>
        private void AddFileToSolutionFolder(string filePath, string solutionFolder)
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
