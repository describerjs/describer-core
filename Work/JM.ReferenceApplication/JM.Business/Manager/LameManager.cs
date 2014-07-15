﻿using JM.Business.Data;
using System.Collections.Generic;

namespace JM.Business.Manager
{
	public interface ILameManager
	{
		List<string> GetCompleteData();
		string GetDataByIndex(int index);
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
			return _repository.GetData();
		}

		public string GetDataByIndex(int index)
		{
			return _repository.GetDatabyIndex(index);
		}
	}
}
