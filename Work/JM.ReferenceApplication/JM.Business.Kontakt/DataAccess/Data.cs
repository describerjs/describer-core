using JM.Business.Kontakt.DataModel;
using System.Data.Entity;

namespace JM.Business.Kontakt.DataAccess
{
    public class Data : DbContext
    {
        public Data() : base("DefaultConnection")
        { }

        public Data(string connectionString) : base(connectionString)
        { }

        public DbSet<PersonalData> CustomerData { get; set; }

        public DbSet<ContactRequest> ContactRequest { get; set; }
    }
}