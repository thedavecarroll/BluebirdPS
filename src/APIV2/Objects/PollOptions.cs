namespace BluebirdPS.APIV2.Objects
{
    public class PollOptions : TwitterObject
    {
        public long Position { get; set; }
        public string Label { get; set; }
        public long Votes { get; set; }

        public PollOptions() { }
        public PollOptions(dynamic input)
        {
            OriginalObject = input;

            Position = input.position;
            Label = input.label;
            Votes = input.votes;
        }

        public override string ToString()
        {
            return $"{Position}) {Label}:{Votes}";
        }

    }
}