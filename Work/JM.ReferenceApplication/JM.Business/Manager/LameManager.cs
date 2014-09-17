using JM.Business.Data;
using JM.Business;
using JM.Foundation;
using System.Collections.Generic;

namespace JM.Business.Manager
{
    [SystemBoundary("Verkauf", BusinesImpact.Low)]
	public interface ILameManager
	{
		List<string> GetCompleteData();

        string GetDataByIndex(int index);

        void ThrowException(int paramter);
	}

	public class LameManager : ILameManager
	{
		private IExampleDataRepository _repository;

		public LameManager(IExampleDataRepository repository)
		{
			_repository = repository;
		}

		public List<string> GetCompleteData()
		{
            ModuleEvents.Log.OnGetCompleteData();
			return _repository.GetData();
		}

		public string GetDataByIndex(int index)
		{
			return _repository.GetDatabyIndex(index);
		}

        public void ThrowException(int paramter)
        {
            throw new System.NotImplementedException();
        }
    }
}
