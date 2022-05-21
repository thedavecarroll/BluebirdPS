using BluebirdPS.APIV2.Objects;

namespace BluebirdPS.APIV2.MediaInfo.Metrics
{
    public class Public : BaseMetrics
    {
        public long ViewCount { get; set; }

        public Public() { }
        public Public(dynamic input)
        {
            ViewCount = input.view_count;
            OriginalObject = input;
        }

    }
}