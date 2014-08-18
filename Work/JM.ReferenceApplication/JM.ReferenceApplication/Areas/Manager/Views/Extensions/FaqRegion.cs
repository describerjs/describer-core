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
    private IDictionary<string, string> _qaAs;

    [UIHint("Stringdictionary")]
    public IDictionary<string, string> QaAs
    {
        get
        {
            if (_qaAs == null)
            {
                _qaAs = new Dictionary<string, string>();
                _qaAs.Add("Test", "Value");
                _qaAs.Add("Frage 2", "Value2");
            }

            return _qaAs;
        }
        set
        {
            _qaAs = value;
        }
    }
}