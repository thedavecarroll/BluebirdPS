namespace BluebirdPS.APIV2.Objects
{
    public class HashTag : BaseEntity
    {
        public string Tag { get; set; }

        public HashTag() { }
        public HashTag(dynamic input)
        {
            Start = input.start;
            End = input.end;
            Tag = input.tag;
            OriginalObject = input;
        }

        public override string ToString()
        {
            return $"#{Tag}";
        }

    }
}