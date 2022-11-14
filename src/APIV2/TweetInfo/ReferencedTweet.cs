namespace BluebirdPS.APIV2.TweetInfo
{
    public class ReferencedTweet : TwitterObject
    {
        public string Type;
        public string Id;

        public ReferencedTweet() { }
        public ReferencedTweet(dynamic input)
        {
            Type = Helpers.ToTitleCase(input.type);
            Id = input.id;
            OriginalObject = input;
        }

    }
}