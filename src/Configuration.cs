using System;

namespace BluebirdPS
{
    public class Configuration
    {
        public string ProfileName { get; set; }
        public string AuthUserId { get; set; }
        public string AuthUserName { get; set; }
        public DateTime? AuthValidationDate { get; set; }
        public DateTime? AuthLastExportDate { get; set; }
        public RateLimitAction RateLimitAction { get; set; } = RateLimitAction.Warning;
        public int RateLimitThreshold { get; set; } = 5;
        public string ConfigurationPath { get; set; }
        public string CredentialsPath { get; set; }
        public OutputType OutputType { get; set; } = OutputType.CustomClasses;
        public AccessLevel AccessLevel { get; set; }
        public Configuration() { }

    }
}
