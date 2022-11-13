using BluebirdPS.APIV2.UserInfo;
using System;
using System.Collections;
using System.Diagnostics.CodeAnalysis;

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
        public string MastodonUrl { get; set; }

        public TwitterMastodonReference(User twitterUser, Hashtable mastodonMatch, string element)
        {
            TwitterUserName = twitterUser.UserName;
            TwitterUser = twitterUser.Name;
            TwitterUrl = $"https://twitter.com/{twitterUser.UserName}";
            TwitterElement = element;
            MastodonUser = mastodonMatch["MastodonUser"].ToString();
            MastodonInstance = mastodonMatch["MastodonInstance"].ToString().Replace("/web", "");
            if (!mastodonMatch["MastodonInstance"].ToString().Contains("counter.social"))
            {
                MastodonUrl = $"https://{mastodonMatch["MastodonInstance"]}/{mastodonMatch["MastodonUser"]}";
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