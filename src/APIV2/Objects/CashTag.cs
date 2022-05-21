namespace BluebirdPS.APIV2.Objects
{
 public class CashTag : BaseEntity
    {
        public string Tag { get; set; }

        public CashTag() { }
        public CashTag(dynamic input)
        {
            Start = input.start;
            End = input.end;
            Tag = input.tag;
            OriginalObject = input;
        }

        public override string ToString()
        {
            return $"${Tag}";
        }

    }
}