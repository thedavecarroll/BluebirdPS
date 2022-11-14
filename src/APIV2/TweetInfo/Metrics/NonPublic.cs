using BluebirdPS.APIV2.Objects;

namespace BluebirdPS.APIV2.TweetInfo.Metrics
{
    public class NonPublic : BaseMetrics
    {
        public long ImpressionCount { get; set; }
        public long UrlLinkClicks { get; set; }
        public long UserProfileClicks { get; set; }

        public NonPublic() { }
        public NonPublic(dynamic input)
        {
            ImpressionCount = input.impression_count;
            UserProfileClicks = input.user_profile_clicks;

            if (Helpers.HasProperty(input, "url_link_clicks")) {
                UrlLinkClicks = input.url_link_clicks;
            }
        }

    }
}