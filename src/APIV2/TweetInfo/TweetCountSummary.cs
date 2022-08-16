using System;
using System.Globalization;

namespace BluebirdPS.APIV2.TweetInfo
{
    public class TweetCountSummary
    {
        public string SearchString { get; set; }
        public string Granularity { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public long TotalCount { get; set; }

        public TweetCountSummary() { }
        public TweetCountSummary(string search, string granularity, DateTime starttime, DateTime endtime, long totalCount)
        {
            SearchString = search;
            Granularity = granularity;
            StartTime = starttime.ToLocalTime();
            EndTime = endtime.ToLocalTime();
            TotalCount = totalCount;
        }

        public override string ToString()
        {
            return $"SearchString: {SearchString}, Granularity: {Granularity}, TotalCount: {TotalCount}, StartTime: {StartTime.ToString("G", DateTimeFormatInfo.InvariantInfo)}, EndTime: {EndTime.ToString("G", DateTimeFormatInfo.InvariantInfo)}";
        }

    }
}