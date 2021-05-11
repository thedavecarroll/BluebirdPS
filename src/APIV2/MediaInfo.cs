using System;
using BluebirdPS.APIV2.MediaInfo.Metrics;
using BluebirdPS.APIV2.Objects;

namespace BluebirdPS.APIV2.MediaInfo
{
    public enum MediaType
    {
        AnimatedGif,
        Photo,
        Video
    }

    public class Media : TwitterObject
    {
        public string MediaKey { get; set; }
        public MediaType Type { get; set; }
        public int? Duration { get; set; }
        public long Height { get; set; }
        public Public PublicMetrics { get; set; }
        public NonPublic NonPublicMetrics { get; set; }
        public Organic OrganicMetrics { get; set; }
        public Promoted PromotedMetrics { get; set; }
        public long Width { get; set; }
        public Uri PreviewImageUrl { get; set; }

        public Media() { }
        public Media(dynamic input)
        {
            try
            {
                OriginalObject = input;

                Enum.TryParse(input.type, true, out MediaType mediaType);

                MediaKey = input.media_key;
                Type = mediaType;
                Height = input.height;
                Width = input.width;
                if (Helpers.HasProperty(input, "duration_ms"))
                {
                    Duration = input.duration_ms;
                }
                if (Helpers.HasProperty(input, "preview_image_url"))
                {
                    PreviewImageUrl = new Uri(input.preview_image_url);
                }

                if (Helpers.HasProperty(input, "non_public_metrics"))
                {
                    NonPublicMetrics = new NonPublic(input.non_public_metrics);
                }
                if (Helpers.HasProperty(input, "organic_metrics"))
                {
                    OrganicMetrics = new Organic(input.organic_metrics);
                }
                if (Helpers.HasProperty(input, "promoted_metrics"))
                {
                    PromotedMetrics = new Promoted(input.promoted_metrics);
                }
            }
            catch {
                // any missing properties that are not on the input object
                // and not caught with Helpers.HasProperty if statement,
                // do not fail (for now)
            }
            }

        }

    namespace Metrics
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

        public class NonPublic : BaseMetrics
        {
            public long PlaybackCount_0 { get; set; }
            public long PlaybackCount_100 { get; set; }
            public long PlaybackCount_25 { get; set; }
            public long PlaybackCount_50 { get; set; }
            public long PlaybackCount_75 { get; set; }
            public long ViewCount { get; set; }

            public NonPublic() { }
            public NonPublic(dynamic input)
            {
                PlaybackCount_0 = input.playback_0_count;
                PlaybackCount_100 = input.playback_100_count;
                PlaybackCount_25 = input.playback_25_count;
                PlaybackCount_50 = input.playback_50_count;
                PlaybackCount_75 = input.playback_75_count;
                ViewCount = input.view_count;
                OriginalObject = input;
            }
        }

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
                OriginalObject = input;
            }
        }

        public class Promoted : BaseMetrics
        {
            public long PlaybackCount_0 { get; set; }
            public long PlaybackCount_100 { get; set; }
            public long PlaybackCount_25 { get; set; }
            public long PlaybackCount_50 { get; set; }
            public long PlaybackCount_75 { get; set; }
            public long ViewCount { get; set; }

            public Promoted() { }
            public Promoted(dynamic input)
            {
                PlaybackCount_0 = input.playback_0_count;
                PlaybackCount_100 = input.playback_100_count;
                PlaybackCount_25 = input.playback_25_count;
                PlaybackCount_50 = input.playback_50_count;
                PlaybackCount_75 = input.playback_75_count;
                ViewCount = input.view_count;
                OriginalObject = input;
            }
        }

    }

}
