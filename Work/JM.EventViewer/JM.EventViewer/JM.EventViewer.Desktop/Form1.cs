using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Reactive.Linq;
using System.Reactive.PlatformServices;

namespace JM.EventViewer.Desktop
{
    public partial class Form1 : Form
    {
        private IObservable<Microsoft.Diagnostics.Tracing.TraceEvent> eventStream;

        public Form1()
        {
            InitializeComponent();
        }

        public Form1(IObservable<Microsoft.Diagnostics.Tracing.TraceEvent> eventStream) : this()
        {
            // TODO: Complete member initialization
            this.eventStream = eventStream;
        }

        protected override void OnShown(EventArgs e)
        {
            base.OnShown(e);
            
            this
                .eventStream
                .ObserveOn(this)
                .Subscribe(te => this.listBox1.Items.Add(te.ToString()));
        }
    }
}
