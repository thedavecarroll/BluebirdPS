using System;
using System.Globalization;

namespace BluebirdPS.APIV2.TweetInfo
{
    public class TweetCount : TwitterObject
    {
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
        public long Count { get; set; }

        public TweetCount(dynamic input)
        {
            OriginalObject = input;

            Start = input.start.ToLocalTime();
            End = input.end.ToLocalTime();
            Count = input.tweet_count;
        }

        public override string ToString()
        {
            return $"Start: {Start.ToString("G",DateTimeFormatInfo.InvariantInfo)}, End: {End.ToString("G", DateTimeFormatInfo.InvariantInfo)}, Count: {Count}";
        }

    }
}