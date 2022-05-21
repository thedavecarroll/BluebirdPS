using BluebirdPS.APIV2.Objects;
using System;
using System.Collections.Generic;

namespace BluebirdPS.APIV2.UserInfo
{
    public class User : TwitterObject
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }

        // remaining properties included with all user.fields
        public DateTime? CreatedAt { get; set; }
        public string Description { get; set; }
        public List<object> Entities { get; set; }
        public string Location { get; set; }
        public string PinnedTweetId { get; set; }
        public Uri ProfileImageUrl { get; set; }
        public bool Protected { get; set; }
        public Metrics.Public PublicMetrics { get; set; }
        public Uri Url { get; set; }
        public bool Verified { get; set; }
        public WithheldContent Withheld { get; set; }

        public User() { }
        public User(dynamic input)
        {
            try
            {
                OriginalObject = input;

                if (Helpers.HasProperty(input, "username"))
                {
                    Id = input.id;
                    UserName = input.username;
                    CreatedAt = input.created_at ?? null;
                    PinnedTweetId = input.pinned_tweet_id;
                    PublicMetrics = new Metrics.Public(input.public_metrics);
                }
                else if (Helpers.HasProperty(input, "screen_name"))
                {
                    Id = input.id.ToString();
                    UserName = input.screen_name;
                    CreatedAt = input.Helpers.ConvertFromV1Date(input.created_at) ?? null;
                }

                Name = input.name;
                Description = input.description;
                Entities = BaseEntity.GetEntities(input.entities);
                Location = input.location;
                ProfileImageUrl = new Uri(input.profile_image_url);
                Protected = input.@protected ?? null;
                Url = new Uri(input.url);
                Verified = input.verified ?? null;

                if (Helpers.HasProperty(input, "withheld"))
                {
                    Withheld = new WithheldContent(input.withheld);
                }
            }
            catch
            {
                // any missing properties that are not on the input object
                // and not caught with Helpers.HasProperty if statement,
                // do not fail(for now)
            }
        }

        public override string ToString()
        {
            return $"{UserName}:{Id}:{Name}";
        }

    }
}