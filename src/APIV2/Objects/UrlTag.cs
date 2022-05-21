using System;
using System.Collections.Generic;

namespace BluebirdPS.APIV2.Objects
{
    public class UrlTag : BaseEntity
    {
        public Uri Url { get; set; }
        public Uri ExpandedUrl { get; set; }
        public string DisplayUrl { get; set; }
        public List<Image> Images { get; set; }
        public string Status { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Uri UnwoundUrl { get; set; }

        public UrlTag() { }
        public UrlTag(dynamic input)
        {
            Start = input.start;
            End = input.end;
            Url = new Uri(input.url);
            ExpandedUrl = new Uri(input.expanded_url);
            DisplayUrl = input.display_url;
            OriginalObject = input;

            if (Helpers.HasProperty(input, "status"))
            {
                Status = input.status.ToString();
            }
            if (Helpers.HasProperty(input, "title"))
            {
                Title = input.title;
            }
            if (Helpers.HasProperty(input, "description"))
            {
                Description = input.description;
            }
            if (Helpers.HasProperty(input, "unwound_url"))
            {
                UnwoundUrl = new Uri(input.unwound_url);
            }
            if (Helpers.HasProperty(input, "images"))
            {
                List<Image> images = new List<Image>();
                foreach (dynamic pic in input.images)
                {
                    images.Add(new Image(pic));
                }
                Images = images;
            }

        }

        public override string ToString() => ExpandedUrl.AbsoluteUri;

    }
}