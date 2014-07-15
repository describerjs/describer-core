using System.Collections.Generic;
using JM.Business.Data;
using JM.Foundation;
using System;

namespace JM.Business.Manager
{
    [SystemBoundary("Verkauf", BusinesImpact.High)]
	public interface IImportantManager
	{
		List<string> GetCompleteData();
		string GetDataByIndex(int index);
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
            //return _repository.GetData();
            throw new NotImplementedException(); 
		}

		public string GetDataByIndex(int index)
		{
            throw new NotImplementedException(); 
			//return _repository.GetDatabyIndex(index);
		}
	}
}
