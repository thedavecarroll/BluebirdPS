using BluebirdPS.APIV2.Objects;

namespace BluebirdPS.APIV2.UserInfo.Metrics
{
    public class Public : BaseMetrics
    {
        public long FollowersCount { get; set; }
        public long FollowingCount { get; set; }
        public long ListedCount { get; set; }
        public long TweetCount { get; set; }

        public Public() { }
        public Public(dynamic input)
        {
            FollowersCount = input.followers_count;
            FollowingCount = input.following_count;
            ListedCount = input.listed_count;
            TweetCount = input.tweet_count;
        }

    }
}