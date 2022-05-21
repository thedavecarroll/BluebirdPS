using System.Collections.Generic;
using System.Reflection;

namespace BluebirdPS.APIV1
{
    public class Source
    {
        public string Id { get; private set; }
        public string UserName { get; private set; }
        public bool Following { get; private set; }
        public bool FollowedBy { get; private set; }
        public bool LiveFollowing { get; private set; }
        public bool FollowingReceived { get; private set; }
        public bool FollowingRequested { get; private set; }
        public bool NotificationsEnabled { get; private set; }
        public bool CanDM { get; private set; }
        public bool Blocking { get; private set; }
        public bool BlockedBy { get; private set; }
        public bool Muting { get; private set; }
        public bool WantRetweets { get; private set; }
        public bool AllReplies { get; private set; }
        public bool MarkedSpam { get; private set; }

        public Source(dynamic input)
        {
            Id = input.id_str;
            UserName = input.screen_name;
            Following = input.following;
            FollowedBy = input.followed_by;
            LiveFollowing = input.live_following;
            FollowingReceived = input.following_received;
            FollowingRequested = input.following_requested;
            NotificationsEnabled = input.notifications_enabled;
            CanDM = input.can_dm;
            Blocking = input.blocking;
            BlockedBy = input.blocked_by;
            Muting = input.muting;
            WantRetweets = input.want_retweets;
            AllReplies = input.all_replies;
            MarkedSpam = input.marked_spam;
        }

        public override string ToString()
        {
            List<string> sourceDetails = new List<string>();
            PropertyInfo[] properties = typeof(Source).GetProperties();
            foreach (PropertyInfo property in properties)
            {
                if (property.PropertyType.Name == "Boolean")
                {
                    if ((bool)property.GetValue(this))
                    {
                        sourceDetails.Add(property.Name);
                    }
                }
            }
            return sourceDetails.Count > 1 ? $"{UserName} : {string.Join(", ", sourceDetails)}" : $"{UserName} : None";
        }

    }
}