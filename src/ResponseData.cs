using System;
using System.Collections;
using System.Net;

namespace BluebirdPS
{
    public class ResponseData
    {
        public string Command { get; set; }
        public HttpMethod HttpMethod { get; set; }
        public Uri Uri { get; set; }
        public string QueryString { get; set; }
        public string Body { get; set; }
        public Hashtable Form { get; set; }
        public HttpStatusCode Status { get; set; }
        public string Server { get; set; }
        public int? ResponseTime { get; set; }
        public int? RateLimit { get; set; }
        public int? RateLimitRemaining { get; set; }
        public DateTime RateLimitReset { get; set; }
        public object HeaderResponse { get; set; }
        public string ApiVersion { get; set; }
        public dynamic ApiResponse { get; set; }

        public ResponseData() { }
        public ResponseData(TwitterRequest request, Authentication authentication, dynamic headerResponse, HttpStatusCode statusCode, dynamic apiResponse) {
            Command = request.CommandName;
            HttpMethod = request.HttpMethod;
            Uri = authentication.Uri;
            QueryString = authentication.Uri.Query;
            Body = request.Body;
            Form = request.Form;
            Status = statusCode;
            try
            {
                Server = headerResponse["server"][0];
                ResponseTime = int.Parse(headerResponse["x-response-time"][0]);
                RateLimit = int.Parse(headerResponse["x-rate-limit-limit"][0]);
                RateLimitRemaining = int.Parse(headerResponse["x-rate-limit-remaining"][0]);

                DateTime resetTime = new DateTime(1970, 1, 1, 0, 0, 0, 0);
                RateLimitReset = resetTime.AddSeconds(int.Parse(headerResponse["x-rate-limit-reset"][0])).ToLocalTime();
            }
            catch
            {

            }
            HeaderResponse = headerResponse;
            ApiResponse = apiResponse;
            ApiVersion = request.GetAPIVersion();
        }

    }

}
