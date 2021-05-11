using System;
using System.Text;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;

namespace BluebirdPS
{
    public enum OAuthVersion
    {
        OAuth1a, OAuth2Bearer, Basic
    }

    public class Authentication
    {        
        // Properties for Invoke-RestMethod        
        public string HttpMethod { get; private set; }
        public Uri Uri { get; private set; }
        public string AuthHeader { get; private set; }

        // Properties to validate OAuth 1.0a request authentication
        public string ParameterString { get; private set; }
        public string SignatureBaseString { get; private set; }
        public string SigningKey { get; private set; }
        public string OAuthSignature { get; private set; }
        public string Nonce { get; private set; }
        public string Timestamp { get; private set; }

        // Prrivate properties       
        private string _apiKey { get; set; }
        private string _apiSecret { get; set; }
        private string _accessToken { get; set; }
        private string _accessTokenSecret { get; set; }

        // ----------------------------------------------------------------------------------------
        // Constructors
        // OAuth 1.0a
        public Authentication (
            TwitterRequest request,
            string apiKey, string apiSecret,
            string accessToken, string accessTokenSecret,
            string nonce = null, string timestamp = null)
        {
            _apiKey = apiKey;
            _apiSecret = apiSecret;
            _accessToken = accessToken;
            _accessTokenSecret = accessTokenSecret;

            Nonce = nonce ?? GetNonce();
            Timestamp = timestamp ?? GetUnixTime();
            
            SigningKey = $"{Uri.EscapeDataString(_apiSecret)}&{Uri.EscapeDataString(_accessTokenSecret)}";

            HttpMethod = request.HttpMethod.ToString();
            Uri = request.GetUri();

            string baseUri;
            if (Uri.Query != string.Empty)
            {
                baseUri = Uri.AbsoluteUri.Replace(Uri.Query, null);
            }
            else
            {
                baseUri = Uri.AbsoluteUri;
            }
            
            SetParameterString();

            SignatureBaseString = $"{HttpMethod}&{Uri.EscapeDataString(baseUri)}&{Uri.EscapeDataString(ParameterString)}";
                        
            SetOAuthSignature();
            SetOAuthHeaderString();
        }

        // OAuth 2.0 Bearer Token
        public Authentication (
            TwitterRequest request,
            string bearerToken
        )
        {
            HttpMethod = request.HttpMethod.ToString();
            Uri = request.GetUri();
            AuthHeader = $"Bearer {bearerToken}";
        }

        // Basic Authentication
        public Authentication(
            TwitterRequest request,
            string apiKey, string apiSecret
        )
        {
            HttpMethod = request.HttpMethod.ToString();
            Uri = request.GetUri();
            string basicAuth = Convert.ToBase64String(Encoding.ASCII.GetBytes($"{apiKey}:{apiSecret}"));
            AuthHeader = $"Basic {basicAuth}";
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
            return DateTimeOffset.Now.ToUnixTimeSeconds().ToString();
        }

        private List<OAuthParameter> GetOAuthHeaderParameters()
        {
            return new List<OAuthParameter>
            {
                { new OAuthParameter("oauth_consumer_key",_apiKey,false) },
                { new OAuthParameter("oauth_nonce",Nonce,false) },
                { new OAuthParameter("oauth_signature_method","HMAC-SHA1",false) },
                { new OAuthParameter("oauth_timestamp",Timestamp,false) },
                { new OAuthParameter("oauth_token",_accessToken,false) },
                { new OAuthParameter("oauth_version","1.0",false) }
            };
        }

        private void SetParameterString()
        {
            List<OAuthParameter> parameters = new List<OAuthParameter>();

            if (Uri.Query != string.Empty)
            {
                foreach (string query in Uri.UnescapeDataString(Uri.Query).Substring(1).Split('&'))
                {
                    string[] queryFields = query.Split('=');
                    OAuthParameter parameter = new OAuthParameter(queryFields[0], queryFields[1], false);
                    parameters.Add(parameter);
                }
            }

            List<OAuthParameter> oauthHeaderParameters = GetOAuthHeaderParameters();
            List<OAuthParameter> allOAuthParameters = parameters
                .Concat(oauthHeaderParameters)
                .OrderBy(o => o.EncodedName)
                .ToList();

            List<string> parameterString = new List<string>();
            parameterString.AddRange(from OAuthParameter parameter in allOAuthParameters
                                        select parameter.ToString());

            ParameterString = string.Join("&", parameterString);            
        }

        private void SetOAuthSignature()
        {
            HMACSHA1 signatureMethod = new HMACSHA1
            {
                Key = Encoding.ASCII.GetBytes(SigningKey)
            };

            OAuthSignature = Convert.ToBase64String(signatureMethod.ComputeHash(Encoding.ASCII.GetBytes(SignatureBaseString)));
        }
        
        private void SetOAuthHeaderString()
        {
            List<OAuthParameter> oauthHeaderParameters = GetOAuthHeaderParameters();
            oauthHeaderParameters.Insert(2, new OAuthParameter("oauth_signature", OAuthSignature, false));

            List<string> oauthHeaderString = (from OAuthParameter headerParameter in oauthHeaderParameters
                                              select headerParameter.ToHeaderString()).ToList();

            AuthHeader = $"OAuth {string.Join(", ", oauthHeaderString)}";
        }

    }

    internal class OAuthParameter : IComparable<OAuthParameter>
    {
        public OAuthParameter(string name,
                              string value,
                              bool isEncoded)
        {
            if (!isEncoded)
            {
                EncodedName = Uri.EscapeDataString(name);
                EncodedValue = Uri.EscapeDataString(value);
            }
            else
            {
                EncodedName = name;
                EncodedValue = value;
            }
        }

        public string EncodedName { get; }
        public string EncodedValue { get; }

        public int CompareTo(OAuthParameter other)
        {
            var nameComparison = string.CompareOrdinal(EncodedName, other.EncodedName);

            if (nameComparison == 0)
            {
                return string.CompareOrdinal(EncodedValue, other.EncodedValue);
            }

            return nameComparison;
        }

        public override string ToString()
        {
            return $"{EncodedName}={EncodedValue}";
        }

        public string ToHeaderString()
        {
            return $"{EncodedName}=\"{EncodedValue}\"";
        }
    }

}
