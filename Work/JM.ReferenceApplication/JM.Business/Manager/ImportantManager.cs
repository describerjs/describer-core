using Autofac.Extras.DynamicProxy2;
using JM.Business.Configuration;
using JM.Business.Data;
using JM.Foundation;
using JM.Foundation.Configuration;
using JM.Foundation.ErrorHandling;
using System;
using System.Collections.Generic;

namespace JM.Business.Manager
{
    [SystemBoundary("Verkauf", BusinesImpact.High)]
    [Intercept(typeof(ErrorInterceptor))]
	public interface IImportantManager
	{
	    List<string> GetCompleteData();
	    string GetDataByIndex(int index);
	    string GetModuleInfo();
	    string GetDeviceFromConfig(int index);
	}

	public class ImportantManager : IImportantManager
	{
		private IExampleDataRepository _repository;

		public ImportantManager(IExampleDataRepository repository)
		{
			_repository = repository;
		}

		public List<string> GetCompleteData()
		{
            return _repository.GetData();
		}

		public string GetDataByIndex(int index)
		{
			return _repository.GetDatabyIndex(index);
		}

		public string GetModuleInfo()
		{
			var config = ApplicationConfiguration.GetConfigSection<Config>("JM.Business");
			return String.Format("Das ist Modul {0} in der Version {1}.", config.ModuleName, config.ModuleVersion);
		}

		public string GetDeviceFromConfig(int index)
		{
			var config = ApplicationConfiguration.GetConfigSection<Config>("JM.Business");
			var device = config.DeviceList[index];

			if (device == null)
				return String.Format("Kein Element bei Index '{0}'.", index);

			return String.Format("Konfiguriertes Device mit Index '{1}': {0}Name: {2}{0}ID: {3}{0}Hersteller: {4}.", Environment.NewLine, index, device.Name, device.Id, device.Manufacturer);
		}
	}
}
