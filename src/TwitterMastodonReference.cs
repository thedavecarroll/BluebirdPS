using BluebirdPS.APIV2.UserInfo;
using System;
using System.Collections;
using System.Diagnostics.CodeAnalysis;
using System.Text.RegularExpressions;

namespace BluebirdPS
{
    public class TwitterMastodonReference : IEquatable<TwitterMastodonReference>
    {

        public string TwitterUserName { get; set; }
        public string TwitterUser { get; set; }
        public string TwitterUrl { get; set; }
        public string TwitterElement { get; set; }
        public string MastodonUser { get; set; }
        public string MastodonInstance { get; set; }
        public string MastodonAccountAddress { get; set; }
        public string MastodonUrl { get; set; }
        public bool IsValidDomain { get; set; }

        public TwitterMastodonReference(User twitterUser, Hashtable mastodonMatch, string element)
        {
            TwitterUserName = twitterUser.UserName;
            TwitterUser = twitterUser.Name;
            TwitterUrl = $"https://twitter.com/{twitterUser.UserName}";
            TwitterElement = element;

            Regex validDomainName = new Regex("^(([a-zA-Z]{1})|([a-zA-Z]{1}[a-zA-Z]{1})|([a-zA-Z]{1}[0-9]{1})|([0-9]{1}[a-zA-Z]{1})|([a-zA-Z0-9][a-zA-Z0-9-_]{1,61}[a-zA-Z0-9]))\\.([a-zA-Z]{2,6}|[a-zA-Z0-9-]{2,30}\\.[a-zA-Z]{2,3})");

            string mastodonUser = mastodonMatch["MastodonUser"].ToString();
            string mastodonInstance = mastodonMatch["MastodonInstance"].ToString().Replace("/web", "");

            MastodonUser = mastodonUser;
            MastodonInstance = mastodonInstance;
            MastodonAccountAddress = $"{mastodonUser}@{mastodonInstance}";
            IsValidDomain = validDomainName.IsMatch(mastodonInstance);
            if (IsValidDomain)
            {
                MastodonUrl = $"https://{mastodonInstance}/{mastodonUser}";
            }

        }

        public bool Equals([AllowNull] TwitterMastodonReference other)
        {
            return TwitterUser == other.TwitterUser
                && TwitterElement == other.TwitterElement
                && MastodonUser == other.MastodonUser
                && MastodonInstance == other.MastodonInstance;
        }

    }
}