using System.Collections.Generic;

namespace JM.Business.Data
{
	public interface IExampleDataRepository
	{
		List<string> GetData();

        string GetDatabyIndex(int index);
	}
}
