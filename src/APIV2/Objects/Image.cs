using System;

namespace BluebirdPS.APIV2.Objects
{
    public class Image : TwitterObject
    {
        public Uri Url { get; set; }
        public long Width { get; set; }
        public long Height { get; set; }

        public Image() { }
        public Image(dynamic input)
        {
            Url = new Uri(input.url);
            Width = input.width;
            Height = input.height;
            OriginalObject = input;
        }

        public override string ToString()
        {
            return Url.AbsoluteUri;
        }

    }
}