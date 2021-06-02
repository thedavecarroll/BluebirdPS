using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BluebirdPS
{
    public class EndpointInfo
    {
        public string CommandName { get; private set; }
        public string Visibility { get; private set; }
        public List<string> ApiEndpoint { get; private set; }
        public List<string> ApiDocumentation { get; private set; }

        public EndpointInfo(string commandName, string visibility, string[] apiEndpoint, string[] apiDocumenation)
        {
            CommandName = commandName;
            Visibility = visibility;
            ApiEndpoint = apiEndpoint.ToList();
            ApiDocumentation = apiDocumenation.ToList();
        }
    }
}
