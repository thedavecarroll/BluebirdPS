using System;
using System.Collections;
using System.Collections.Generic;
using System.Management.Automation;
using System.Linq;
using System.Net;

namespace BluebirdPS
{
    public class ResponseData
    {
        public string Command { get; set; }
        public DateTime Timestamp { get; set; }
        public InvocationInfo InvocationInfo { get; set; }
        public HttpMethod HttpMethod { get; set; }
        public Uri Uri { get; set; }
        public string Endpoint { get; set; }
        public string QueryString { get; set; }
        public string Body { get; set; }
        public Hashtable Form { get; set; }
        public OAuthVersion OAuthVersion { get; set; }
        public HttpStatusCode Status { get; set; }
        public string Server { get; set; }
        public string ResponseTime { get; set; }
        public string RateLimit { get; set; }
        public string RateLimitRemaining { get; set; }
        public DateTime RateLimitReset { get; set; }
        public Hashtable HeaderResponse { get; set; }
        public string ApiVersion { get; set; }
        public dynamic ApiResponse { get; set; }

        public ResponseData() { }
        public ResponseData(TwitterRequest request, Authentication authentication, dynamic headerResponse, HttpStatusCode statusCode, dynamic apiResponse)
        {
            try
            {
                Command = request.CommandName;
                Timestamp = DateTime.Now;
                InvocationInfo = request.InvocationInfo;
                HttpMethod = request.HttpMethod;
                Uri = authentication.Uri;
                Endpoint = authentication.Endpoint;
                QueryString = authentication.Uri.Query;
                Body = request.Body;
                Form = request.Form;
                OAuthVersion = request.OAuthVersion;
                Status = statusCode;
                ApiResponse = apiResponse;
                ApiVersion = request.GetAPIVersion();

                SetHeaderVariables(headerResponse);
            }
            catch { }
        }

        private void SetHeaderVariables(dynamic headerResponse)
        {
            Hashtable headers = new Hashtable();
            IEnumerable<string> values;

            foreach (var kvp in headerResponse)
            {
                if (headerResponse.GetType().Name == "HttpResponseHeaders")
                {
                    headerResponse.TryGetValues(kvp.Key, out values);
                    {
                        if (headers.ContainsKey(kvp.Key) == false)
                        {
                            headers.Add(kvp.Key, values.First());
                        }                        
                    }
                } 
                else
                {
                    headerResponse.TryGetValue(kvp.Key, out values);
                    {
                        if (headers.ContainsKey(kvp.Key) == false)
                        {
                            headers.Add(kvp.Key, values.First());
                        }
                    }
                }

            }
            HeaderResponse = headers;

            Server = (string)HeaderResponse["Server"];
            ResponseTime = HeaderResponse.ContainsKey("x-response-time") ? (string)HeaderResponse["x-response-time"] : null;

            RateLimit = HeaderResponse.ContainsKey("x-rate-limit-limit") ? (string)HeaderResponse["x-rate-limit-limit"] : null;
            RateLimitRemaining = HeaderResponse.ContainsKey("x-rate-limit-remaining") ? (string)HeaderResponse["x-rate-limit-remaining"] : null;
                
            if (HeaderResponse.ContainsKey("x-rate-limit-reset") && HeaderResponse["x-rate-limit-reset"] != null)
            {
                DateTime resetTime = new DateTime(1970, 1, 1, 0, 0, 0, 0);
                RateLimitReset = resetTime.AddSeconds(int.Parse((string)HeaderResponse["x-rate-limit-reset"])).ToLocalTime();
            }
        }
    }
}
