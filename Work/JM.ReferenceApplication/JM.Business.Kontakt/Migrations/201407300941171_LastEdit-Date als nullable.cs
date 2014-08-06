namespace JM.Business.Kontakt.Migrations
{
    using System.Data.Entity.Migrations;
    
    public partial class LastEditDatealsnullable : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.PersonalData", "LastEditAt", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.PersonalData", "LastEditAt", c => c.DateTime(nullable: false));
        }
    }
}
