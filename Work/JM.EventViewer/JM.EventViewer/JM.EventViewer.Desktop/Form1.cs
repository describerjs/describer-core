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
using System.Diagnostics;
using Microsoft.Diagnostics.Tracing.Session;
using Microsoft.Diagnostics.Tracing;
using System.Reactive.Disposables;

namespace JM.EventViewer.Desktop
{
    public partial class Form1 : Form
    {
        private IObservable<Microsoft.Diagnostics.Tracing.TraceEvent> eventStream;
        private CompositeDisposable eventSubscriptions = new CompositeDisposable();
        private IDisposable monitoredEventSubscription = null;

        private TraceEventSession userSession;

        public Form1()
        {
            InitializeComponent();
        }

        public Form1(IObservable<Microsoft.Diagnostics.Tracing.TraceEvent> eventStream) : this()
        {
            // TODO: Complete member initialization
            this.eventStream = eventStream;
        }

        public Form1(TraceEventSession userSession) : this()
        {
            // TODO: Complete member initialization
            this.userSession = userSession;
            this.eventStream = userSession.Source.Dynamic.Observe(null);
        }

        protected override void OnShown(EventArgs e)
        {
            base.OnShown(e);
            
                //eventStream
                //    .Subscribe(e => Debug.WriteLine(e.ToString()));

            this.eventSubscriptions.Add(
                this
                    .eventStream
                    .ObserveOn(this)
                    .Subscribe(te => this.listBox1.Items.Add(te.ToString())));
        }

        protected override void OnClosing(CancelEventArgs e)
        {
            if (this.eventSubscriptions != null)
            {
                this.eventSubscriptions.Dispose();
                this.eventSubscriptions = null;
            }

            base.OnClosing(e);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (this.monitoredEventSubscription != null)
            {
                this.monitoredEventSubscription.Dispose();
            }

            int warningThreshold;

            if (!int.TryParse(textBox2.Text, out warningThreshold))
            {
                warningThreshold = 1;
            }

            var windowObservable =
                this
                .eventStream
                .Where(ev => ev.EventName == textBox1.Text)
                .Buffer(TimeSpan.FromSeconds(10));

            this.monitoredEventSubscription =
                windowObservable
                .Select(l => l.Count())
                .Where(c => c >= warningThreshold)
                .ObserveOn(this)
                .Subscribe(c =>
                    MessageBox.Show(
                        string.Format("Mehr als '{0}' von '{1}' pro 10 Sekunden", c.ToString(), textBox1.Text)));
                
        }
    }
}
