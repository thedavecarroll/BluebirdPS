using System;

namespace BluebirdPS.APIV2.Media
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
        public class Public
        {
            public Int64 ViewCount { get; set; }

            public Public() { }
            public Public(dynamic input)
            {
                ViewCount = input.view_count;
            }
        }

        public class NonPublic
        {
            public Int64 PlaybackCount_0 { get; set; }
            public Int64 PlaybackCount_100 { get; set; }
            public Int64 PlaybackCount_25 { get; set; }
            public Int64 PlaybackCount_50 { get; set; }
            public Int64 PlaybackCount_75 { get; set; }
            public Int64 ViewCount { get; set; }

            public NonPublic() { }
            public NonPublic(dynamic input)
            {
                PlaybackCount_0 = input.playback_0_count;
                PlaybackCount_100 = input.playback_100_count;
                PlaybackCount_25 = input.playback_25_count;
                PlaybackCount_50 = input.playback_50_count;
                PlaybackCount_75 = input.playback_75_count;
                ViewCount = input.view_count;
            }
        }

        public class Organic
        {
            public Int64 PlaybackCount_0 { get; set; }
            public Int64 PlaybackCount_100 { get; set; }
            public Int64 PlaybackCount_25 { get; set; }
            public Int64 PlaybackCount_50 { get; set; }
            public Int64 PlaybackCount_75 { get; set; }
            public Int64 ViewCount { get; set; }

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

        public class Promoted
        {
            public Int64 PlaybackCount_0 { get; set; }
            public Int64 PlaybackCount_100 { get; set; }
            public Int64 PlaybackCount_25 { get; set; }
            public Int64 PlaybackCount_50 { get; set; }
            public Int64 PlaybackCount_75 { get; set; }
            public Int64 ViewCount { get; set; }

            public Promoted() { }
            public Promoted(dynamic input)
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

}
