using Piranha.Extend;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.ComponentModel.DataAnnotations;

[Export(typeof(IExtension))]
[ExportMetadata("InternalId", "FaqRegion")]
[ExportMetadata("Name", "Faq")]
[ExportMetadata("Type", ExtensionType.Region)]
[Serializable]
public class FaqRegion : Extension
{
    private IDictionary<string, string> qaAs;

    [UIHint("Stringdictionary")]
    public IDictionary<string, string> QaAs
    {
        get
        {
            if (this.qaAs == null)
            {
                this.qaAs = new Dictionary<string, string>();
                this.qaAs.Add("Test", "Value");
                this.qaAs.Add("Frage 2", "Value2");
            }

            return this.qaAs;
        }
        set
        {
            this.qaAs = value;
        }
    }
}