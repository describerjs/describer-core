using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using EnvDTE;
using EnvDTE80;

namespace JM.BaseSolutionWizard
{
    public class ProjectFileManager
    {
        private readonly _DTE _dte;
        private readonly Dictionary<string, string> _replacementsDictionary;
        private const string PROJECTNAME = "$projectname$";
        private const string SOLUTIONDIRECTORY = "$destinationdirectory$";
        private readonly string _templateDirectory;

        public ProjectFileManager(_DTE dte, Dictionary<string, string> replacementsDictionary, string templatePath)
        {
            _dte = dte;
            _replacementsDictionary = replacementsDictionary;

            var templateInfo = new FileInfo(templatePath);
            _templateDirectory = templateInfo.DirectoryName;
        }

        public void CopyFile(string fromFolder, string toFolder, string fileName)
        {
            var filePath = Path.Combine(fromFolder, fileName);

            if(File.Exists(filePath))
                File.Copy(filePath, Path.Combine(toFolder, fileName));
        }
        public void CopyDirectory(string fromFolder, string toFolder, string directoryName)
        {
            var directoryPath = Path.Combine(fromFolder, directoryName);
            
            if (Directory.Exists(directoryPath))
            {
                var directoryInfo = new DirectoryInfo(directoryPath);

                var newDirectoryPath = Path.Combine(toFolder, directoryName);
                Directory.CreateDirectory(newDirectoryPath);

                var subDirectories = directoryInfo.GetDirectories();
                if (subDirectories.Any())
                    subDirectories.ToList().ForEach(d => CopyDirectory(directoryPath, newDirectoryPath, d.Name));
                
                var files = directoryInfo.GetFiles();
                if (files.Any())
                    files.ToList().ForEach(f => CopyFile(directoryPath, newDirectoryPath, f.Name));
            }
        }

        public void AddFileToProject(string filepath, Project project)
        {
            if (File.Exists(filepath) && project != null)
            {
                project.ProjectItems.AddFromFile(filepath);
            }
        }
        public Project AddDirectoryToProject(string directoryPath, Project project = null)
        {
            if (Directory.Exists(directoryPath))
            {
                var directoryInfo = new DirectoryInfo(directoryPath);
                Project subProject;

                if (project == null)
                {
                    var solution = (Solution2)_dte.Solution;
                    subProject = solution.AddSolutionFolder(directoryInfo.Name);
                }
                else
                {
                    var folder = (SolutionFolder)project.Object;
                    subProject = folder.AddSolutionFolder(directoryInfo.Name);
                }
                AddFilesToSolutionFolder(subProject, directoryInfo.GetFiles());
                AddDirectoriesToSolutionFolder(subProject, directoryInfo.GetDirectories());

                return subProject;
            }
            return null;
        }
        public void AddDirectoriesToSolutionFolder(Project project, IEnumerable<DirectoryInfo> directories)
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
        public void AddFilesToSolutionFolder(Project project, IEnumerable<FileInfo> files)
        {
            if (files != null && files.Any())
            {
                foreach (var file in files)
                {
                    project.ProjectItems.AddFromFile(file.FullName);
                }
            }
        }
        public void CloseAllOpenedDocuments()
        {
            foreach (var window in _dte.Windows.Cast<Window>())
            {
                var type = window.Type;
                if (type == vsWindowType.vsWindowTypeDocument)
                    window.Close();
            }
        }

        /// <summary>
        /// Liefert den Pfad der erstellten Solution.
        /// </summary>
        /// <returns></returns>
        public string SolutionRootPath { get { return _replacementsDictionary[SOLUTIONDIRECTORY]; } }

        /// <summary>
        /// Liefert der Name der erstellten Solutions
        /// </summary>
        /// <returns></returns>
        public string SolutionName { get { return _replacementsDictionary[PROJECTNAME]; } }

        /// <summary>
        /// der physicalische Path wo das Template liegt.
        /// </summary>
        /// <returns></returns>
        public string TemplateDirectory { get { return _templateDirectory; } }

        /// <summary>
        /// Liefert einen lesenden Filestream auf eine Datei, die sich in der template.zip befindet.
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        /// <remarks>Die Datei muss sich im Root-Verzeichnis des Templates befinden.</remarks>
        [Obsolete]
        public Stream GetFilestreamFromTemplate(string filename)
        {
            var filePath = Path.Combine(TemplateDirectory, filename);

            if (File.Exists(filePath))
            {
                return new FileStream(filePath, FileMode.Open, FileAccess.ReadWrite);
            }

            return null;
        }
    }
}
