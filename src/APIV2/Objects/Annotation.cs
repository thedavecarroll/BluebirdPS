namespace BluebirdPS.APIV2.Objects
{
    public class Annotation : BaseEntity
    {
        public double Probability { get; set; }
        public string Type { get; set; }
        public string NormalizedText { get; set; }

        public Annotation() { }
        public Annotation(dynamic input)
        {
            Start = input.start;
            End = input.end;
            Probability = input.probability;
            Type = input.type;
            NormalizedText = input.normalized_text;
            OriginalObject = input;
        }

        public override string ToString()
        {
            return $"{Type}: {NormalizedText}";
        }

    }
}