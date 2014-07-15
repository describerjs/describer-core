using System.Collections.Generic;
using System.Linq;

namespace JM.Business.Data
{
	public class ExampleDataRepository : IExampleDataRepository
	{
		private List<string> _data = new List<string>
		{
			"Lorem ipsum dolor sit amet",
			"consetetur sadipscing elitr",
			"sed diam nonumy",
			"eirmod tempor invidunt",
			"ut labore et",
			"dolore magna aliquyam",
			"erat, sed diam",
			"voluptua. At vero",
			"eos et accusam",
			"et justo duo",
			"dolores et ea",
			"rebum. Stet clita",
			"kasd gubergren, no",
			"sea takimata sanctus",
			"est Lorem ipsum"
		};

		public List<string> GetData()
		{
			return _data;
		}

		public string GetDatabyIndex(int index)
		{
			return _data.ElementAt(index);
		}
	}
}
