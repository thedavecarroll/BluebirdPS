using System;
using System.Collections.Generic;
using System.Text;

namespace BluebirdPS.APIV1
{
    public class RateLimitStatus
    {
        public string ResourceType { get; set; }
        public string Resource { get; set; }
        public string Limit { get; set; }
        public string Remaining { get; set; }
        public DateTime ResetTime { get; set; }

        public RateLimitStatus(string type, string resource, long limit, long remaining, long reset)
        {

        }
    }
}
