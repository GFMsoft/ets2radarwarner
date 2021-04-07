namespace Ets2SdkClient.Demo
{
    partial class Ets2SdkClientDemo
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Ets2SdkClientDemo));
            this.telemetryInfo = new System.Windows.Forms.TabControl();
            this.tabAbout = new System.Windows.Forms.TabPage();
            this.lbGeneral = new System.Windows.Forms.RichTextBox();
            this.lblDemo = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox_x = new System.Windows.Forms.TextBox();
            this.textBox_z = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.telemetryInfo.SuspendLayout();
            this.tabAbout.SuspendLayout();
            this.SuspendLayout();
            // 
            // telemetryInfo
            // 
            this.telemetryInfo.Controls.Add(this.tabAbout);
            this.telemetryInfo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.telemetryInfo.Location = new System.Drawing.Point(0, 0);
            this.telemetryInfo.Name = "telemetryInfo";
            this.telemetryInfo.SelectedIndex = 0;
            this.telemetryInfo.Size = new System.Drawing.Size(595, 379);
            this.telemetryInfo.TabIndex = 0;
            // 
            // tabAbout
            // 
            this.tabAbout.Controls.Add(this.label3);
            this.tabAbout.Controls.Add(this.label2);
            this.tabAbout.Controls.Add(this.textBox_z);
            this.tabAbout.Controls.Add(this.textBox_x);
            this.tabAbout.Controls.Add(this.label1);
            this.tabAbout.Controls.Add(this.lbGeneral);
            this.tabAbout.Controls.Add(this.lblDemo);
            this.tabAbout.Location = new System.Drawing.Point(4, 22);
            this.tabAbout.Name = "tabAbout";
            this.tabAbout.Padding = new System.Windows.Forms.Padding(3);
            this.tabAbout.Size = new System.Drawing.Size(587, 353);
            this.tabAbout.TabIndex = 0;
            this.tabAbout.Text = "About";
            this.tabAbout.UseVisualStyleBackColor = true;
            this.tabAbout.Click += new System.EventHandler(this.tabAbout_Click);
            // 
            // lbGeneral
            // 
            this.lbGeneral.Location = new System.Drawing.Point(8, 31);
            this.lbGeneral.Name = "lbGeneral";
            this.lbGeneral.Size = new System.Drawing.Size(571, 243);
            this.lbGeneral.TabIndex = 2;
            this.lbGeneral.Text = "";
            // 
            // lblDemo
            // 
            this.lblDemo.AutoSize = true;
            this.lblDemo.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDemo.Location = new System.Drawing.Point(195, 3);
            this.lblDemo.Name = "lblDemo";
            this.lblDemo.Size = new System.Drawing.Size(210, 25);
            this.lblDemo.TabIndex = 0;
            this.lblDemo.Text = "ETS2 Radarwarner";
            this.lblDemo.Click += new System.EventHandler(this.lblDemo_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(484, 350);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(95, 25);
            this.label1.TabIndex = 3;
            this.label1.Text = "by goku";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // textBox_x
            // 
            this.textBox_x.Location = new System.Drawing.Point(171, 307);
            this.textBox_x.Name = "textBox_x";
            this.textBox_x.Size = new System.Drawing.Size(100, 20);
            this.textBox_x.TabIndex = 4;
            // 
            // textBox_z
            // 
            this.textBox_z.Location = new System.Drawing.Point(305, 306);
            this.textBox_z.Name = "textBox_z";
            this.textBox_z.Size = new System.Drawing.Size(100, 20);
            this.textBox_z.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(198, 291);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(45, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "X-Coord";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(332, 291);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(45, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Z-Coord";
            // 
            // Ets2SdkClientDemo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(595, 379);
            this.Controls.Add(this.telemetryInfo);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Ets2SdkClientDemo";
            this.Text = "ETS2 - Radarwarner";
            this.telemetryInfo.ResumeLayout(false);
            this.tabAbout.ResumeLayout(false);
            this.tabAbout.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl telemetryInfo;
        private System.Windows.Forms.TabPage tabAbout;
        private System.Windows.Forms.Label lblDemo;
        private System.Windows.Forms.RichTextBox lbGeneral;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox_z;
        private System.Windows.Forms.TextBox textBox_x;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
    }
}

