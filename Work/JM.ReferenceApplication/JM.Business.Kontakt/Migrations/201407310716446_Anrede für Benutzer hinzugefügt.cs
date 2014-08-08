namespace JM.Business.Kontakt.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AnredefürBenutzerhinzugefügt : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PersonalData", "Salutation", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.PersonalData", "Salutation");
        }
    }
}
