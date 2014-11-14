namespace JM.ReferenceApplication.Areas.JMTools.Models
{
    public class Trace
    {
        public string ID { get; set; }
        public string InstanceName { get; set; }
        public string ProviderName { get; set; }
        public string EventId { get; set; }
        public string EventKeywords { get; set; }
        public string Level { get; set; }
        public string Opcode { get; set; }
        public string Task { get; set; }
        public string Timestamp { get; set; }
        public string Version { get; set; }
        public string FormattedMessage { get; set; }
        public string Payload { get; set; }
        public string ActivityId { get; set; }
        public string RelatedActivityId { get; set; }
    }
}