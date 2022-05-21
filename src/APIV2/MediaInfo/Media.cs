using System;
using BluebirdPS.APIV2.MediaInfo.Metrics;

namespace BluebirdPS.APIV2.MediaInfo
{
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
        public Uri Url { get; set; }
        public string AltText { get; set; }

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
                if (Helpers.HasProperty(input, "url"))
                {
                    Url = new Uri(input.url);
                }
                if (Helpers.HasProperty(input, "alt_text"))
                {
                    AltText = input.alt_text;
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
}