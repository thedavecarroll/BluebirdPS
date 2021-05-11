using System;
using System.Collections;
using System.Collections.Generic;
using System.Management.Automation;
using BluebirdPS.APIV2;
using System.Linq;
using System.Management.Automation.Runspaces;

namespace BluebirdPS
{
    public enum HttpMethod
    {
        GET, POST, DELETE, PATCH, PUT, HEAD, OPTIONS, TRACE
    }

    public enum ExpansionTypes
    {
        Tweet, User
    }

    public class TwitterRequest
    {
        // ----------------------------------------------------------------------------------------
        // Properties
        public HttpMethod HttpMethod { get; set; }
        public Uri Endpoint { get; set; }
        public OAuthVersion OAuthVersion { get; set; }
        public Hashtable Query { get; set; } = new Hashtable();
        public string Body { get; set; }
        public Hashtable Form { get; set; }
        public string ContentType { get; set; } = "application/json";
        public ExpansionTypes? Expansions { get; set; }
        public bool NonPublicMetrics { get; set; }
        public bool PromotedMetrics { get; set; }
        public bool OrganicMetrics { get; set; }
        public string CommandName { get; private set; }
        private bool _isExpanded { get; set; }

        // ----------------------------------------------------------------------------------------
        // Constructor
        // The intent is for the class to be instantiated using accelerator and hashtable
        public TwitterRequest() 
        {
            SetCommandName();
        }

        // ----------------------------------------------------------------------------------------
        // Public methods
        public void SetCommandName()
        {
            try
            {
                IEnumerable<CallStackFrame> callstack = Runspace.DefaultRunspace.Debugger.GetCallStack();
                CommandName = callstack.ToList().First().FunctionName;
            }
            catch { }
        }

        public void SetCommandName(string command)
        {
            CommandName = command;
        }

        public string GetAPIVersion()
        {
            return Endpoint.Segments[1].Trim('/');
        }

        public Uri GetUri()
        {
            SetQueryExpansionFields();

            string RequestUri;

            if (Query.Count > 0)
            {
                List<string> queryFields = (from DictionaryEntry kvp in Query
                                            select $"{Uri.EscapeDataString(kvp.Key.ToString())}={Uri.EscapeDataString(kvp.Value.ToString())}").ToList();
                
                RequestUri = $"{Endpoint.AbsoluteUri.TrimEnd('/')}?{string.Join("&", queryFields)}";
            
            } 
            else
            {
                RequestUri = Endpoint.AbsoluteUri;
            }

            return new Uri(RequestUri);
        }

        // ----------------------------------------------------------------------------------------
        // Public methods
        private void SetQueryExpansionFields()
        {
            if (_isExpanded == false && Expansions != null)
            {
                if (Expansions == ExpansionTypes.Tweet)
                {
                    Query.Add("expansions", ExpansionFields.GetExpansionFields(ExpansionTypes.Tweet));
                    Query.Add("tweet.fields", ObjectFields.GetFieldList("Tweet", NonPublicMetrics, OrganicMetrics, PromotedMetrics));
                    Query.Add("user.fields", ObjectFields.GetFieldList("User"));
                    Query.Add("media.fields", ObjectFields.GetFieldList("Media", NonPublicMetrics, OrganicMetrics, PromotedMetrics));
                    Query.Add("poll.fields", ObjectFields.GetFieldList("Poll"));
                    Query.Add("place.fields", ObjectFields.GetFieldList("Place"));
                }
                else if (Expansions == ExpansionTypes.User)
                {
                    Query.Add("expansions", ExpansionFields.GetExpansionFields(ExpansionTypes.User));
                    Query.Add("user.fields", ObjectFields.GetFieldList("User"));
                    Query.Add("tweet.fields", ObjectFields.GetFieldList("Tweet", NonPublicMetrics, OrganicMetrics, PromotedMetrics));
                }
                _isExpanded = true;
            }
        }

    }
}
