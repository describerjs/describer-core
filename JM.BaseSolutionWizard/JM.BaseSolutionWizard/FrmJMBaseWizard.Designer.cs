namespace JM.BaseSolutionWizard
{
    partial class FrmJMBaseWizard
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label adminConnectionStringLabel;
            System.Windows.Forms.Label standardConnectionStringLabel;
            System.Windows.Forms.Label environmentNameLabel;
            System.Windows.Forms.Label isLocalLabel;
            System.Windows.Forms.Label lblLoggingConnectionString;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmJMBaseWizard));
            this.environmentViewModelBindingNavigator = new System.Windows.Forms.BindingNavigator(this.components);
            this.bindingNavigatorAddNewItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorCountItem = new System.Windows.Forms.ToolStripLabel();
            this.bindingNavigatorDeleteItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMoveFirstItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMovePreviousItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorSeparator = new System.Windows.Forms.ToolStripSeparator();
            this.bindingNavigatorPositionItem = new System.Windows.Forms.ToolStripTextBox();
            this.bindingNavigatorSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.bindingNavigatorMoveNextItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMoveLastItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.environmentViewModelBindingNavigatorSaveItem = new System.Windows.Forms.ToolStripButton();
            this.adminConnectionStringTextBox = new System.Windows.Forms.TextBox();
            this.standardConnectionStringTextBox = new System.Windows.Forms.TextBox();
            this.environmentNameTextBox = new System.Windows.Forms.TextBox();
            this.isLocalCheckBox = new System.Windows.Forms.CheckBox();
            this.txtLoggingConnectionString = new System.Windows.Forms.TextBox();
            this.environmentViewModelBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            adminConnectionStringLabel = new System.Windows.Forms.Label();
            standardConnectionStringLabel = new System.Windows.Forms.Label();
            environmentNameLabel = new System.Windows.Forms.Label();
            isLocalLabel = new System.Windows.Forms.Label();
            lblLoggingConnectionString = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.environmentViewModelBindingNavigator)).BeginInit();
            this.environmentViewModelBindingNavigator.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.environmentViewModelBindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // adminConnectionStringLabel
            // 
            adminConnectionStringLabel.AutoSize = true;
            adminConnectionStringLabel.Location = new System.Drawing.Point(12, 69);
            adminConnectionStringLabel.Name = "adminConnectionStringLabel";
            adminConnectionStringLabel.Size = new System.Drawing.Size(167, 13);
            adminConnectionStringLabel.TabIndex = 4;
            adminConnectionStringLabel.Text = "Admin/Piranha Connection String:";
            // 
            // standardConnectionStringLabel
            // 
            standardConnectionStringLabel.AutoSize = true;
            standardConnectionStringLabel.Location = new System.Drawing.Point(12, 95);
            standardConnectionStringLabel.Name = "standardConnectionStringLabel";
            standardConnectionStringLabel.Size = new System.Drawing.Size(140, 13);
            standardConnectionStringLabel.TabIndex = 8;
            standardConnectionStringLabel.Text = "Standard Connection String:";
            // 
            // environmentNameLabel
            // 
            environmentNameLabel.AutoSize = true;
            environmentNameLabel.Location = new System.Drawing.Point(12, 43);
            environmentNameLabel.Name = "environmentNameLabel";
            environmentNameLabel.Size = new System.Drawing.Size(100, 13);
            environmentNameLabel.TabIndex = 10;
            environmentNameLabel.Text = "Environment Name:";
            // 
            // isLocalLabel
            // 
            isLocalLabel.AutoSize = true;
            isLocalLabel.Location = new System.Drawing.Point(12, 141);
            isLocalLabel.Name = "isLocalLabel";
            isLocalLabel.Size = new System.Drawing.Size(47, 13);
            isLocalLabel.TabIndex = 11;
            isLocalLabel.Text = "Is Local:";
            // 
            // lblLoggingConnectionString
            // 
            lblLoggingConnectionString.AutoSize = true;
            lblLoggingConnectionString.Location = new System.Drawing.Point(12, 121);
            lblLoggingConnectionString.Name = "lblLoggingConnectionString";
            lblLoggingConnectionString.Size = new System.Drawing.Size(135, 13);
            lblLoggingConnectionString.TabIndex = 13;
            lblLoggingConnectionString.Text = "Logging Connection String:";
            // 
            // environmentViewModelBindingNavigator
            // 
            this.environmentViewModelBindingNavigator.AddNewItem = this.bindingNavigatorAddNewItem;
            this.environmentViewModelBindingNavigator.BindingSource = this.environmentViewModelBindingSource1;
            this.environmentViewModelBindingNavigator.CountItem = this.bindingNavigatorCountItem;
            this.environmentViewModelBindingNavigator.DeleteItem = this.bindingNavigatorDeleteItem;
            this.environmentViewModelBindingNavigator.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.bindingNavigatorMoveFirstItem,
            this.bindingNavigatorMovePreviousItem,
            this.bindingNavigatorSeparator,
            this.bindingNavigatorPositionItem,
            this.bindingNavigatorCountItem,
            this.bindingNavigatorSeparator1,
            this.bindingNavigatorMoveNextItem,
            this.bindingNavigatorMoveLastItem,
            this.bindingNavigatorSeparator2,
            this.bindingNavigatorAddNewItem,
            this.bindingNavigatorDeleteItem,
            this.environmentViewModelBindingNavigatorSaveItem});
            this.environmentViewModelBindingNavigator.Location = new System.Drawing.Point(0, 0);
            this.environmentViewModelBindingNavigator.MoveFirstItem = this.bindingNavigatorMoveFirstItem;
            this.environmentViewModelBindingNavigator.MoveLastItem = this.bindingNavigatorMoveLastItem;
            this.environmentViewModelBindingNavigator.MoveNextItem = this.bindingNavigatorMoveNextItem;
            this.environmentViewModelBindingNavigator.MovePreviousItem = this.bindingNavigatorMovePreviousItem;
            this.environmentViewModelBindingNavigator.Name = "environmentViewModelBindingNavigator";
            this.environmentViewModelBindingNavigator.PositionItem = this.bindingNavigatorPositionItem;
            this.environmentViewModelBindingNavigator.Size = new System.Drawing.Size(394, 25);
            this.environmentViewModelBindingNavigator.TabIndex = 4;
            this.environmentViewModelBindingNavigator.Text = "bindingNavigator1";
            // 
            // bindingNavigatorAddNewItem
            // 
            this.bindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorAddNewItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorAddNewItem.Image")));
            this.bindingNavigatorAddNewItem.Name = "bindingNavigatorAddNewItem";
            this.bindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorAddNewItem.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorAddNewItem.Text = "Neu hinzufügen";
            // 
            // environmentViewModelBindingSource
            // 
            this.environmentViewModelBindingSource1.DataSource = typeof(JM.BaseSolutionWizard.EnvironmentViewModel);
            // 
            // bindingNavigatorCountItem
            // 
            this.bindingNavigatorCountItem.Name = "bindingNavigatorCountItem";
            this.bindingNavigatorCountItem.Size = new System.Drawing.Size(44, 22);
            this.bindingNavigatorCountItem.Text = "von {0}";
            this.bindingNavigatorCountItem.ToolTipText = "Die Gesamtanzahl der Elemente.";
            // 
            // bindingNavigatorDeleteItem
            // 
            this.bindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorDeleteItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorDeleteItem.Image")));
            this.bindingNavigatorDeleteItem.Name = "bindingNavigatorDeleteItem";
            this.bindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorDeleteItem.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorDeleteItem.Text = "Löschen";
            // 
            // bindingNavigatorMoveFirstItem
            // 
            this.bindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveFirstItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveFirstItem.Image")));
            this.bindingNavigatorMoveFirstItem.Name = "bindingNavigatorMoveFirstItem";
            this.bindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveFirstItem.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveFirstItem.Text = "Erste verschieben";
            // 
            // bindingNavigatorMovePreviousItem
            // 
            this.bindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMovePreviousItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMovePreviousItem.Image")));
            this.bindingNavigatorMovePreviousItem.Name = "bindingNavigatorMovePreviousItem";
            this.bindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMovePreviousItem.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMovePreviousItem.Text = "Vorherige verschieben";
            // 
            // bindingNavigatorSeparator
            // 
            this.bindingNavigatorSeparator.Name = "bindingNavigatorSeparator";
            this.bindingNavigatorSeparator.Size = new System.Drawing.Size(6, 25);
            // 
            // bindingNavigatorPositionItem
            // 
            this.bindingNavigatorPositionItem.AccessibleName = "Position";
            this.bindingNavigatorPositionItem.AutoSize = false;
            this.bindingNavigatorPositionItem.Name = "bindingNavigatorPositionItem";
            this.bindingNavigatorPositionItem.Size = new System.Drawing.Size(50, 23);
            this.bindingNavigatorPositionItem.Text = "0";
            this.bindingNavigatorPositionItem.ToolTipText = "Aktuelle Position";
            // 
            // bindingNavigatorSeparator1
            // 
            this.bindingNavigatorSeparator1.Name = "bindingNavigatorSeparator1";
            this.bindingNavigatorSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // bindingNavigatorMoveNextItem
            // 
            this.bindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveNextItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveNextItem.Image")));
            this.bindingNavigatorMoveNextItem.Name = "bindingNavigatorMoveNextItem";
            this.bindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveNextItem.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveNextItem.Text = "Nächste verschieben";
            // 
            // bindingNavigatorMoveLastItem
            // 
            this.bindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveLastItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveLastItem.Image")));
            this.bindingNavigatorMoveLastItem.Name = "bindingNavigatorMoveLastItem";
            this.bindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveLastItem.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveLastItem.Text = "Letzte verschieben";
            // 
            // bindingNavigatorSeparator2
            // 
            this.bindingNavigatorSeparator2.Name = "bindingNavigatorSeparator2";
            this.bindingNavigatorSeparator2.Size = new System.Drawing.Size(6, 25);
            // 
            // environmentViewModelBindingNavigatorSaveItem
            // 
            this.environmentViewModelBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.environmentViewModelBindingNavigatorSaveItem.Enabled = false;
            this.environmentViewModelBindingNavigatorSaveItem.Image = ((System.Drawing.Image)(resources.GetObject("environmentViewModelBindingNavigatorSaveItem.Image")));
            this.environmentViewModelBindingNavigatorSaveItem.Name = "environmentViewModelBindingNavigatorSaveItem";
            this.environmentViewModelBindingNavigatorSaveItem.Size = new System.Drawing.Size(23, 22);
            this.environmentViewModelBindingNavigatorSaveItem.Text = "Daten speichern";
            // 
            // adminConnectionStringTextBox
            // 
            this.adminConnectionStringTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.environmentViewModelBindingSource1, "AdminConnectionString", true));
            this.adminConnectionStringTextBox.Location = new System.Drawing.Point(183, 66);
            this.adminConnectionStringTextBox.Name = "adminConnectionStringTextBox";
            this.adminConnectionStringTextBox.Size = new System.Drawing.Size(199, 20);
            this.adminConnectionStringTextBox.TabIndex = 5;
            // 
            // standardConnectionStringTextBox
            // 
            this.standardConnectionStringTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.environmentViewModelBindingSource1, "StandardConnectionString", true));
            this.standardConnectionStringTextBox.Location = new System.Drawing.Point(183, 92);
            this.standardConnectionStringTextBox.Name = "standardConnectionStringTextBox";
            this.standardConnectionStringTextBox.Size = new System.Drawing.Size(199, 20);
            this.standardConnectionStringTextBox.TabIndex = 9;
            // 
            // environmentNameTextBox
            // 
            this.environmentNameTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.environmentViewModelBindingSource1, "EnvironmentName", true));
            this.environmentNameTextBox.Location = new System.Drawing.Point(183, 40);
            this.environmentNameTextBox.Name = "environmentNameTextBox";
            this.environmentNameTextBox.Size = new System.Drawing.Size(199, 20);
            this.environmentNameTextBox.TabIndex = 11;
            // 
            // isLocalCheckBox
            // 
            this.isLocalCheckBox.Location = new System.Drawing.Point(183, 141);
            this.isLocalCheckBox.Name = "isLocalCheckBox";
            this.isLocalCheckBox.Size = new System.Drawing.Size(104, 24);
            this.isLocalCheckBox.TabIndex = 12;
            this.isLocalCheckBox.UseVisualStyleBackColor = true;
            // 
            // txtLoggingConnectionString
            // 
            this.txtLoggingConnectionString.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.environmentViewModelBindingSource1, "LoggingConnectionString", true));
            this.txtLoggingConnectionString.Location = new System.Drawing.Point(183, 118);
            this.txtLoggingConnectionString.Name = "txtLoggingConnectionString";
            this.txtLoggingConnectionString.Size = new System.Drawing.Size(199, 20);
            this.txtLoggingConnectionString.TabIndex = 14;
            // 
            // environmentViewModelBindingSource1
            // 
            this.environmentViewModelBindingSource1.DataSource = typeof(JM.BaseSolutionWizard.EnvironmentViewModel);
            // 
            // FrmJMBaseWizard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(394, 194);
            this.Controls.Add(lblLoggingConnectionString);
            this.Controls.Add(this.txtLoggingConnectionString);
            this.Controls.Add(isLocalLabel);
            this.Controls.Add(this.isLocalCheckBox);
            this.Controls.Add(environmentNameLabel);
            this.Controls.Add(this.environmentNameTextBox);
            this.Controls.Add(adminConnectionStringLabel);
            this.Controls.Add(this.adminConnectionStringTextBox);
            this.Controls.Add(standardConnectionStringLabel);
            this.Controls.Add(this.standardConnectionStringTextBox);
            this.Controls.Add(this.environmentViewModelBindingNavigator);
            this.Name = "FrmJMBaseWizard";
            this.Text = "FrmJMBaseWizard";
            ((System.ComponentModel.ISupportInitialize)(this.environmentViewModelBindingNavigator)).EndInit();
            this.environmentViewModelBindingNavigator.ResumeLayout(false);
            this.environmentViewModelBindingNavigator.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.environmentViewModelBindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.BindingNavigator environmentViewModelBindingNavigator;
        private System.Windows.Forms.ToolStripButton bindingNavigatorAddNewItem;
        private System.Windows.Forms.ToolStripLabel bindingNavigatorCountItem;
        private System.Windows.Forms.ToolStripButton bindingNavigatorDeleteItem;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveFirstItem;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMovePreviousItem;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator;
        private System.Windows.Forms.ToolStripTextBox bindingNavigatorPositionItem;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator1;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveNextItem;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveLastItem;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator2;
        private System.Windows.Forms.ToolStripButton environmentViewModelBindingNavigatorSaveItem;
        private System.Windows.Forms.TextBox adminConnectionStringTextBox;
        private System.Windows.Forms.TextBox standardConnectionStringTextBox;
        private System.Windows.Forms.TextBox environmentNameTextBox;
        private System.Windows.Forms.CheckBox isLocalCheckBox;
        private System.Windows.Forms.TextBox txtLoggingConnectionString;
        private System.Windows.Forms.BindingSource environmentViewModelBindingSource1;

    }
}