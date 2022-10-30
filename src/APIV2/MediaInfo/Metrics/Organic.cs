using BluebirdPS.APIV2.Objects;

namespace BluebirdPS.APIV2.MediaInfo.Metrics
{
    public class Organic : BaseMetrics
    {
        public long PlaybackCount_0 { get; set; }
        public long PlaybackCount_100 { get; set; }
        public long PlaybackCount_25 { get; set; }
        public long PlaybackCount_50 { get; set; }
        public long PlaybackCount_75 { get; set; }
        public long ViewCount { get; set; }

        public Organic() { }
        public Organic(dynamic input)
        {
            PlaybackCount_0 = input.playback_0_count;
            PlaybackCount_100 = input.playback_100_count;
            PlaybackCount_25 = input.playback_25_count;
            PlaybackCount_50 = input.playback_50_count;
            PlaybackCount_75 = input.playback_75_count;
            ViewCount = input.view_count;
        }

    }
}