using System.Collections.Generic;
using JM.Business.Data;

namespace JM.Business.Manager
{
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
			return _repository.GetData();
		}

		public string GetDataByIndex(int index)
		{
			return _repository.GetDatabyIndex(index);
		}
	}
}
