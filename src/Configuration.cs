using System;
using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Text;
using System.Text.RegularExpressions;

namespace BluebirdPS
{
    public enum RateLimitAction
    {
        // type of output stream used to display a message
        // when the remaining calls are at the RateLimitThreshold or less

        Verbose,
        Warning,
        Error
    }

    public class Configuration
    {
        
        public string AuthUserId { get; set; }
        public string AuthUserName { get; set; }
        public DateTime? AuthValidationDate { get; set; }
        public DateTime? AuthLastExportDate { get; set; }
        public RateLimitAction RateLimitAction { get; set; } = RateLimitAction.Warning;
        public int RateLimitThreshold { get; set; } = 5;
        public string ConfigurationPath { get; set; }
        public string CredentialsPath { get; set; }
        public bool RawOutput { get; set; } = false;
        public Configuration() { }

    }
}
