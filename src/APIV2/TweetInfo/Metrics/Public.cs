using BluebirdPS.APIV2.Objects;

namespace BluebirdPS.APIV2.TweetInfo.Metrics
{
    public class Public : BaseMetrics
    {
        public long ImpressionCount { get; set; }
        public long RetweetCount { get; set; }
        public long ReplyCount { get; set; }
        public long LikeCount { get; set; }
        public long QuoteCount { get; set; }

        public Public() { }
        public Public(dynamic input)
        {
            ImpressionCount = input.impression_count;
            RetweetCount = input.retweet_count;
            ReplyCount = input.reply_count;
            LikeCount = input.like_count;
            QuoteCount = input.quote_count;
        }

    }
}