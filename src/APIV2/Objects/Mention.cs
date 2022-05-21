namespace BluebirdPS.APIV2.Objects
{
    public class Mention : BaseEntity
    {
        public string UserName { get; set; }
        public string Tag { get; set; }

        public Mention() { }
        public Mention(dynamic input)
        {
            OriginalObject = input;

            Start = input.start;
            End = input.end;

            if (Helpers.HasProperty(input, "tag"))
            {
                Tag = input.tag;
            }
            if(Helpers.HasProperty(input, "username"))
            {
                UserName = input.username;
            }

        }

        public override string ToString()
        {
            return $"@{UserName}";
        }

    }
}