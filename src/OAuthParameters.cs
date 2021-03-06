using System;
using System.Text;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;

namespace BluebirdPS
{
    public enum HttpMethod
    {
        GET, POST, DELETE, PATCH, PUT, HEAD, OPTIONS, TRACE
    }

    public class OAuthParametersC
    {
        // ----------------------------------------------------------------------------------------
        // Properties
        public HttpMethod HttpMethod { get; set; }
        public string BaseUri { get; set; }
        public Hashtable Query { get; set; }
        public UriBuilder UriBuilder { get; set; }
        public string UnescapedQueryString { get; set; }
        public string EscapedQueryString { get; set; }
        public string Body { get; set; }
        public Hashtable Form { get; set; }
        public string ParameterSet { get; set; }

        // ----------------------------------------------------------------------------------------
        // Constructors
        public OAuthParametersC(HttpMethod httpMethod, string baseUri, Hashtable query)
        {
            HttpMethod = httpMethod;
            SetBaseUri(baseUri);
            SetQuery(query);
        }

        public OAuthParametersC(HttpMethod httpMethod, string baseUri)
        {
            HttpMethod = httpMethod;
            SetBaseUri(baseUri);
        }

        // ----------------------------------------------------------------------------------------
        // Public methods

        // Generates the required OAuth v1.0a signature string        
        public string GetOAuthSignatureString (
            string apiKey, string apiSecret,
            string accessToken, string accessTokenSecret,
            string nonce, string timestamp
        )
        {
            if (string.IsNullOrEmpty(nonce))
            {
                nonce = GetNonce();
            }
            if (string.IsNullOrEmpty(timestamp))
            {
                timestamp = GetUnixTime();
            }

            string parameterString = GetParameterString(apiKey, apiSecret, nonce, timestamp);
            
            string signatureBaseString =
                $"{HttpMethod}&{Uri.EscapeDataString(BaseUri)}&{Uri.EscapeDataString(parameterString)}";

            string signingKey =
                $"{Uri.EscapeDataString(apiSecret)}&{Uri.EscapeDataString(accessTokenSecret)}";

            HMACSHA1 signatureMethod = new HMACSHA1
            {
                Key = Encoding.ASCII.GetBytes(signingKey)
            };
            string oauthSignature = 
                Convert.ToBase64String(signatureMethod.ComputeHash(Encoding.ASCII.GetBytes(signatureBaseString)));

            SortedDictionary<string,string> oauthHeader = GetOAuthHeader(apiKey, accessToken, nonce, timestamp);
            oauthHeader.Add("oauth_signature",oauthSignature);

            List<string> oauthHeaderString = new List<string>();
            foreach (KeyValuePair<string, string> kvp in oauthHeader)
            {
                string format = "{0}=\"{1}\"";
                oauthHeaderString.Add(string.Format(format, kvp.Key, Uri.EscapeDataString(kvp.Value)));
            }

            StringBuilder oauthString = new StringBuilder();
            oauthString.Append("OAuth ");
            oauthString.Append(string.Join(", ", oauthHeaderString));

            return oauthString.ToString();
        }

        public void SetQuery(Hashtable query)
        {
            Query = query;
            var sortedQuery = query.Cast<DictionaryEntry>().
                ToDictionary(i => i.Key, i => i.Value).OrderBy(o => o.Key);
            
            List<string> uriQueryString = new List<string>();            
            foreach (var kvp in sortedQuery)
            {
                uriQueryString.Add($@"{kvp.Key}={kvp.Value}");
            }
            UnescapedQueryString = string.Join("&", uriQueryString);
            
            string uriBuilder = Query != null ? $"{BaseUri}?{UnescapedQueryString}" : BaseUri;
            
            UriBuilder = new UriBuilder(uriBuilder);
            EscapedQueryString = UriBuilder.Uri.Query.Substring(1);
        }

        public override string ToString()
        {
            
            int pad = 20;

            string queryString = null;

            Dictionary<string, string> query = new Dictionary<string, string>();
            if (Query != null)
            {
                foreach (string key in Query.Keys)
                {
                    query.Add(key, Query[key].ToString());
                }
                queryString = GetDictionaryString(query, pad);
            }
            
            string fromString = Form?.ToString();
            Dictionary<string, string> outString = new Dictionary<string, string>
            {
                { "HttpMethod", HttpMethod.ToString() },
                { "BaseUri", BaseUri },
                { "Query", queryString },
                { "Uri", UriBuilder.Uri.AbsoluteUri },
                { "UnescapedQueryString", UnescapedQueryString },
                { "EscapedQueryString", EscapedQueryString },
                { "Body", Body },
                { "Form", fromString },
                { "ParameterSet", ParameterSet },
            };

            return  GetDictionaryString(outString, pad); ;
        }

        // ----------------------------------------------------------------------------------------
        // Private methods
        private string GetNonce()
        {
            byte[] numberBytes = new byte[32];
            using (RandomNumberGenerator random = RandomNumberGenerator.Create())
            {
                random.GetBytes(numberBytes);
            }
            return Convert.ToBase64String(numberBytes);
        }

        private string GetUnixTime()
        {
            //DateTime unixEpoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            //return ((long)DateTime.Now.Subtract(unixEpoch).TotalSeconds).ToString();
            return DateTimeOffset.Now.ToUnixTimeSeconds().ToString();
        }

        private SortedDictionary<string, string> GetOAuthHeader(string apiKey, string accessToken, string nonce, string timestamp)
        {
            return new SortedDictionary<string, string>
            {
                { "oauth_consumer_key", apiKey },
                { "oauth_nonce", nonce },
                { "oauth_signature_method", "HMAC-SHA1" },
                { "oauth_timestamp", timestamp },
                { "oauth_token", accessToken },
                { "oauth_version", "1.0" },
            };
        }

        private string GetParameterString(string apiKey, string accessToken, string nonce, string timestamp)
        {
            SortedDictionary<string, string> parameters = new SortedDictionary<string, string>();
            if (Query != null)
            {
                foreach (string key in Query.Keys)
                {
                    parameters.Add(key, Query[key].ToString());
                }
            }

            SortedDictionary<string, string> oauthHeader = GetOAuthHeader(apiKey, accessToken, nonce, timestamp);
            foreach (string key in oauthHeader.Keys)
            {
                parameters.Add(key, oauthHeader[key]);
            }

            List<string> parameterString = new List<string>();
            foreach (KeyValuePair<string, string> kvp in parameters)
            {
                string escapedKey = Uri.UnescapeDataString(kvp.Key) == kvp.Key ? Uri.EscapeDataString(kvp.Key) : kvp.Key;
                string escapedValue = Uri.UnescapeDataString(kvp.Value) == kvp.Value ? Uri.EscapeDataString(kvp.Value) : kvp.Value;
                parameterString.Add($"{escapedKey}={escapedValue}");
            }
            ParameterSet = string.Join("&", parameterString);
            return ParameterSet;
        }

        private void SetBaseUri(string baseUri)
        {
            BaseUri = baseUri;
            UriBuilder = new UriBuilder(BaseUri);
        }     

        private string GetDictionaryString(Dictionary<string, string> dictionary, int pad)
        {
            StringBuilder outString = new StringBuilder();
            foreach (KeyValuePair<string, string> kvp in dictionary)
            {
                string format = $"{{0,-{pad}}} : {{1}}";
                outString.AppendLine(string.Format(format, kvp.Key, kvp.Value));
            }
            return outString.ToString();
        }
    }
}
