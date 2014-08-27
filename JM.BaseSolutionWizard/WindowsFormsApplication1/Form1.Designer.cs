namespace WindowsFormsApplication1
{
    partial class Form1
    {
        /// <summary>
        /// Erforderliche Designervariable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Verwendete Ressourcen bereinigen.
        /// </summary>
        /// <param name="disposing">True, wenn verwaltete Ressourcen gelöscht werden sollen; andernfalls False.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Vom Windows Form-Designer generierter Code

        /// <summary>
        /// Erforderliche Methode für die Designerunterstützung.
        /// Der Inhalt der Methode darf nicht mit dem Code-Editor geändert werden.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnEditEnvironments = new System.Windows.Forms.Button();
            this.btnSaveEnvironemtns = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnEditEnvironments
            // 
            this.btnEditEnvironments.Location = new System.Drawing.Point(12, 338);
            this.btnEditEnvironments.Name = "btnEditEnvironments";
            this.btnEditEnvironments.Size = new System.Drawing.Size(216, 23);
            this.btnEditEnvironments.TabIndex = 0;
            this.btnEditEnvironments.Text = "Umgebungen anpassen";
            this.btnEditEnvironments.UseVisualStyleBackColor = true;
            this.btnEditEnvironments.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnSaveEnvironemtns
            // 
            this.btnSaveEnvironemtns.Location = new System.Drawing.Point(235, 338);
            this.btnSaveEnvironemtns.Name = "btnSaveEnvironemtns";
            this.btnSaveEnvironemtns.Size = new System.Drawing.Size(189, 23);
            this.btnSaveEnvironemtns.TabIndex = 1;
            this.btnSaveEnvironemtns.Text = "Umgebungen vorbereiten";
            this.btnSaveEnvironemtns.UseVisualStyleBackColor = true;
            this.btnSaveEnvironemtns.Click += new System.EventHandler(this.btnSaveEnvironemtns_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(544, 403);
            this.Controls.Add(this.btnSaveEnvironemtns);
            this.Controls.Add(this.btnEditEnvironments);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnEditEnvironments;
        private System.Windows.Forms.Button btnSaveEnvironemtns;
    }
}

