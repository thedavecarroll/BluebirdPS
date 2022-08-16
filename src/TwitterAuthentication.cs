using System.Collections;

namespace BluebirdPS
{
    public class TwitterAuthentication
    {
        public string ApiKey { get; set; }
        public string ApiSecret { get; set; }
        public string AccessToken { get; set; }
        public string AccessTokenSecret { get; set; }
        public string BearerToken { get; set; }
        public TwitterAuthentication(Hashtable OAuth) {
            ApiKey              = (string)OAuth["ApiKey"];
            ApiSecret           = (string)OAuth["ApiSecret"];
            AccessToken         = (string)OAuth["AccessToken"];
            AccessTokenSecret   = (string)OAuth["AccessTokenSecret"];
            BearerToken         = (string)OAuth["BearerToken"];
        }
    }
}
