namespace JM.Business.Kontakt.Migrations
{
    using System.Data.Entity.Migrations;
    
    public partial class USerIDChangetoString : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.ContactRequest", "UserID", c => c.String(nullable: false));
            AlterColumn("dbo.PersonalData", "UserID", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.PersonalData", "UserID", c => c.Int(nullable: false));
            AlterColumn("dbo.ContactRequest", "UserID", c => c.Int(nullable: false));
        }
    }
}
