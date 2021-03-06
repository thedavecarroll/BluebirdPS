using System;
using System.Collections.Generic;

namespace BluebirdPS.APIV2.TwitterUser
{
    public class User : TwitterObject
    {       
        [TwitterAttribute(AttributeType.Condensed)]
        public string Id { get; set; }
        
        [TwitterAttribute(AttributeType.Condensed)]
        public string Name { get; set; }

        [TwitterAttribute(AttributeType.Condensed)]
        public string UserName { get; set; }

        // remaining properties included with all user.fields 
        public DateTime CreatedAt { get; set; }
        public string Description { get; set; }
        public List<object> Entities { get; set; }
        public string Location { get; set; }
        public string PinnedTweetId { get; set; }
        public Uri ProfileImageUrl { get; set; }
        public bool Protected { get; set; }
        public Metrics.Public PublicMetrics { get; set; }
        public Uri Url { get; set; }
        public bool Verified { get; set; }
        public Objects.WithheldContent Withheld { get; set; }

        public User() { }
        public User(dynamic input)
        {
            try
            {
                OriginalObject = input;

                Id = input.id;
                Name = input.name;
                UserName = input.username;

                CreatedAt = input.created_at;
                Description = input.description;
                Entities = Objects.BaseEntity.GetEntities(input.entities);
                Location = input.location;
                PinnedTweetId = input.pinned_tweet_id;
                ProfileImageUrl = new Uri(input.profile_image_url);
                if (Helpers.HasProperty(input, "protected"))
                {
                    Protected = input.@protected;
                }
                PublicMetrics = new Metrics.Public(input.public_metrics);
                Url = new Uri(input.url);
                Verified = input.verified;
                if (Helpers.HasProperty(input, "withheld"))
                {
                    Withheld = new Objects.WithheldContent(input.withheld);
                }
            }
            catch
            {
                // any missing properties that are not on the input object
                // and not caught with Helpers.HasProperty if statement,
                // do not fail(for now)
            }
        }
    }

    namespace Metrics
    {
        public class Public
        {
            public Int64 FollowersCount { get; set; }
            public Int64 FollowingCount { get; set; }
            public Int64 ListedCount { get; set; }
            public Int64 TweetCount { get; set; }

            public Public() { }
            public Public(dynamic input)
            {
                FollowersCount = input.followers_count;
                FollowingCount = input.following_count;
                ListedCount = input.listed_count;
                TweetCount = input.tweet_count;
            }
        }
    }
}
