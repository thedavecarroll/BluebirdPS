using System;
using System.Collections;

namespace BluebirdPS
{
    public class Profile
    {
        public string ProfileName { get; set; }
        public string AuthUserName { get; set; }
        public string AuthUserId { get; set; }
        public DateTime? AuthValidationDate { get; set; }
        public DateTime? AuthLastExportDate { get; set; }
        public AccessLevel AccessLevel { get; set; }
        public string ApiKey { get; set; }
        public string ApiSecret { get; set; }
        public string AccessToken { get; set; }
        public string AccessTokenSecret { get; set; }
        public string BearerToken { get; set; }
        public string ClientId { get; set; }
        public string ClientSecret { get; set; }

        public Profile() {}
        public Profile(Hashtable oauth)
        {
            ImportOAuth(oauth);
        }

        public Profile(Hashtable oauth, Configuration configuration)
        {
            ImportOAuth(oauth);
            ImportConfiguration(configuration);
        }

        private void ImportOAuth(Hashtable OAuth)
        {
            ApiKey              = (string)OAuth["ApiKey"];
            ApiSecret           = (string)OAuth["ApiSecret"];
            AccessToken         = (string)OAuth["AccessToken"];
            AccessTokenSecret   = (string)OAuth["AccessTokenSecret"];
            BearerToken         = (string)OAuth["BearerToken"];
        }

        private void ImportConfiguration(Configuration configuration)
        {
            ProfileName         = configuration.AuthUserName;
            AuthUserName        = configuration.AuthUserName;
            AuthUserId          = configuration.AuthUserId;
            AuthValidationDate  = configuration.AuthValidationDate;
            AuthLastExportDate  = configuration.AuthLastExportDate;
        }
    }
}
