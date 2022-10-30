using BluebirdPS.APIV2.Objects;

namespace BluebirdPS.APIV2.TweetInfo.Metrics
{
    public class Organic : BaseMetrics
    {
        public long ImpressionCount { get; set; }
        public long LikeCount { get; set; }
        public long ReplyCount { get; set; }
        public long RetweetCount { get; set; }
        public long UrlLinkClicks { get; set; }
        public long UserProfileClicks { get; set; }

        public Organic() { }
        public Organic(dynamic input)
        {
            ImpressionCount = input.impression_count;
            LikeCount = input.like_count;
            ReplyCount = input.reply_count;
            RetweetCount = input.retweet_count;
            UrlLinkClicks = input.url_link_clicks;
            UserProfileClicks = input.user_profile_clicks;
        }

    }
}