using System.Collections.Generic;
using System.Linq;

namespace BluebirdPS
{
    public class EndpointInfo
    {
        public string CommandName { get; private set; }
        public List<string> ApiEndpoint { get; private set; }
        public List<string> ApiDocumentation { get; private set; }

        public EndpointInfo(string commandName, string[] apiEndpoint, string[] apiDocumentation)
        {
            CommandName = commandName;
            ApiEndpoint = apiEndpoint.ToList();
            ApiDocumentation = apiDocumentation.ToList();
        }
    }
}
