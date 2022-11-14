using System;
using System.Text;
using System.Linq;
using System.Collections.Generic;
using System.Security.Cryptography;

namespace BluebirdPS
{

    public class Authentication
    {
        #region Properties for Invoke-RestMethod
        public string HttpMethod { get; private set; }
        public Uri Uri { get; private set; }
        public string AuthHeader { get; private set; }
        public string Endpoint { get; private set; }
        #endregion

        #region Properties to validate OAuth 1.0a request authentication
        public string ParameterString { get; private set; }
        public string SignatureBaseString { get; private set; }
        public string SigningKey { get; private set; }
        public string OAuthSignature { get; private set; }
        public string Nonce { get; private set; }
        public string Timestamp { get; private set; }
        #endregion

        #region Private properties
        private string _apiKey { get; set; }
        private string _apiSecret { get; set; }
        private string _accessToken { get; set; }
        private string _accessTokenSecret { get; set; }
        #endregion

        // -----------------------------------------------------------------------------------------
        #region Constructors
        #region OAuth 1.0a
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

            Endpoint = Uri.Query != string.Empty ? Uri.AbsoluteUri.Replace(Uri.Query, null) : Uri.AbsoluteUri;

            SetParameterString();

            SignatureBaseString = $"{HttpMethod}&{Uri.EscapeDataString(Endpoint)}&{Uri.EscapeDataString(ParameterString)}";

            SetOAuthSignature();
            SetOAuthHeaderString();
        }
        #endregion

        #region OAuth 2.0 Bearer Token
        public Authentication (
            TwitterRequest request,
            string bearerToken
        )
        {
            HttpMethod = request.HttpMethod.ToString();
            Uri = request.GetUri();
            Endpoint = Uri.Query != string.Empty ? Uri.AbsoluteUri.Replace(Uri.Query, null) : Uri.AbsoluteUri;
            AuthHeader = $"Bearer {bearerToken}";
        }
        #endregion

        #region Basic Authentication
        public Authentication(
            TwitterRequest request,
            string apiKey, string apiSecret
        )
        {
            HttpMethod = request.HttpMethod.ToString();
            Uri = request.GetUri();
            Endpoint = Uri.Query != string.Empty ? Uri.AbsoluteUri.Replace(Uri.Query, null) : Uri.AbsoluteUri;
            string basicAuth = Convert.ToBase64String(Encoding.ASCII.GetBytes($"{Uri.EscapeDataString(apiKey)}:{Uri.EscapeDataString(apiSecret)}"));
            AuthHeader = $"Basic {basicAuth}";
        }
        #endregion
        #endregion
        // -----------------------------------------------------------------------------------------
        #region Private methods
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

        #endregion
    }

}
