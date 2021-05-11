using BluebirdPS.APIV2.Objects;
using BluebirdPS.APIV2.TweetInfo.Metrics;
using System;
using System.Collections.Generic;
using System.Management.Automation;

namespace BluebirdPS.APIV2.TweetInfo
{
    public class Tweet : TwitterObject
    {
        public string Id { get; set; }
        public string Text { get; set; }

        public Attachments Attachments { get; set; }
        public string AuthorId { get; set; }
        public List<Context.ContextAnnotation> ContextAnnotations { get; set; }
        public string ConversationId { get; set; }
        public DateTime CreatedAt { get; set; }
        public List<object> Entities { get; set; }
        public PSObject Geo { get; set; }
        public string InReplyToUserId { get; set; }
        public string Language { get; set; }
        public Metrics.NonPublic NonPublicMetrics { get; set; }
        public Metrics.Organic OrganicMetrics { get; set; }
        public bool PossiblySensitive { get; set; }
        public Metrics.Promoted PromotedMetrics { get; set; }
        public Metrics.Public PublicMetrics { get; set; }
        public List<ReferencedTweet> ReferencedTweets { get; set; }
        public string ReplySettings { get; set; }
        public string Source { get; set; }
        public Objects.WithheldContent Withheld { get; set; }

        public Tweet() { }
        public Tweet(dynamic input)
        {
            try
            {
                OriginalObject = input;

                Id = input.id;
                Text = input.text;
                AuthorId = input.author_id;
                ConversationId = input.conversation_id;
                CreatedAt = input.created_at;
                Entities = BaseEntity.GetEntities(input.entities);
                InReplyToUserId = input.in_reply_to_user_id;
                Language = input.lang;
                PossiblySensitive = input.possibly_sensitive;
                PublicMetrics = new Metrics.Public(input.public_metrics);
                Source = input.source;

                if (Helpers.HasProperty(input, "attachments"))
                {
                    Attachments = new Attachments(input.attachments);
                }

                if (Helpers.HasProperty(input, "geo"))
                {
                    Geo = input.geo;
                    OriginalObject = input;
                }

                if (Helpers.HasProperty(input, "reply_settings"))
                {
                    ReplySettings = Helpers.ToTitleCase(input.reply_settings);
                }

                if (Helpers.HasProperty(input, "withheld"))
                {
                    Withheld = new WithheldContent(input.withheld);
                }

                if (Helpers.HasProperty(input, "referenced_tweets"))
                {
                    List<ReferencedTweet> referencedTweets = new List<ReferencedTweet>();
                    foreach (dynamic refTweet in input.referenced_tweets)
                    {
                        referencedTweets.Add(new ReferencedTweet(refTweet));
                    }
                    ReferencedTweets = referencedTweets;
                }

                if (Helpers.HasProperty(input, "context_annotations"))
                {
                    List<Context.ContextAnnotation> contextAnnotations = new List<Context.ContextAnnotation>();

                }

                if (Helpers.HasProperty(input, "non_public_metrics"))
                {
                    NonPublicMetrics = new NonPublic(input.non_public_metrics);
                }
                if (Helpers.HasProperty(input, "organic_metrics"))
                {
                    OrganicMetrics = new Organic(input.organic_metrics);
                }
                if (Helpers.HasProperty(input, "promoted_metrics"))
                {
                    PromotedMetrics = new Promoted(input.promoted_metrics);
                }
            }
            catch
            {
                // any missing properties that are not on the input object
                // and not caught with Helpers.HasProperty if statement,
                // do not fail (for now)
            }
        }

    }

    public class ReferencedTweet : TwitterObject
    {
        public string Type;
        public string Id;

        public ReferencedTweet() { }
        public ReferencedTweet(dynamic input)
        {
            Type = Helpers.ToTitleCase(input.type);
            Id = input.id;
            OriginalObject = input;
        }
    }

    public class Attachments : TwitterObject
    {
        public string Type { get; set; }
        public List<string> Ids { get; set; }

        public Attachments() { }
        public Attachments(dynamic input) {
            OriginalObject = input;

            try
            {
                List<string> attachments = new List<string>();

                if (Helpers.HasProperty(input, "poll_ids"))
                {
                    Type = "Poll";
                    foreach (string attachment in input.poll_ids)
                    {
                        attachments.Add(attachment);
                    }

                }
                else if (Helpers.HasProperty(input, "media_keys"))
                {
                    Type = "MediaInfo";
                    foreach (string attachment in input.media_keys)
                    {
                        attachments.Add(attachment);
                    }
                }                
                Ids = attachments;
            }
            catch
            {

            }
        }

    }

    namespace Metrics
    {

        public class Public : BaseMetrics
        {
            public long RetweetCount { get; set; }
            public long ReplyCount { get; set; }
            public long LikeCount { get; set; }
            public long QuoteCount { get; set; }

            public Public() { }
            public Public(dynamic input)
            {
                RetweetCount = input.retweet_count;
                ReplyCount = input.reply_count;
                LikeCount = input.like_count;
                QuoteCount = input.quote_count;
                OriginalObject = input;
            }


        }

        public class NonPublic : BaseMetrics
        {
            public long ImpressionCount { get; set; }
            public long UrlLinkClicks { get; set; }
            public long UserProfileClicks { get; set; }

            public NonPublic() { }
            public NonPublic(dynamic input)
            {
                ImpressionCount = input.impression_count;
                UrlLinkClicks = input.url_link_clicks;
                UserProfileClicks = input.user_profile_clicks;
                OriginalObject = input;
            }
        }

        public class Organic : BaseMetrics
        {
            public long ImpressionCount { get; set; }
            public long LikeCount { get; set; }
            public long ReplyCount { get; set; }
            public long RetweetCount { get; set; }
            public long UrlLinkClicks { get; set; }
            public long UserProfileClicks { get; set; }

            public Organic() { }
            public Organic(dynamic input)
            {
                ImpressionCount = input.impression_count;
                LikeCount = input.like_count;
                ReplyCount = input.reply_count;
                RetweetCount = input.retweet_count;
                UrlLinkClicks = input.url_link_clicks;
                UserProfileClicks = input.user_profile_clicks;
                OriginalObject = input;
            }
        }

        public class Promoted : BaseMetrics
        {
            public long ImpressionCount { get; set; }
            public long LikeCount { get; set; }
            public long ReplyCount { get; set; }
            public long RetweetCount { get; set; }
            public long UrlLinkClicks { get; set; }
            public long UserProfileClicks { get; set; }

            public Promoted() { }
            public Promoted(dynamic input)
            {
                ImpressionCount = input.impression_count;
                LikeCount = input.like_count;
                ReplyCount = input.reply_count;
                RetweetCount = input.retweet_count;
                UrlLinkClicks = input.url_link_clicks;
                UserProfileClicks = input.user_profile_clicks;
                OriginalObject = input;
            }
        }

    }

    namespace Context
    {
        public class ContextAnnotation : TwitterObject
        {
            public Domain Domain { get; set; }
            public Entity Entity { get; set; }

            ContextAnnotation() { }
            ContextAnnotation(dynamic input) {
                OriginalObject = input;
                if (Helpers.HasProperty(input, "domain"))
                {
                    Domain = new Domain(input.domain);
                }
                if (Helpers.HasProperty(input, "entity"))
                {
                    Entity = new Entity(input.entity);
                }
            }
        }

        public class Domain : TwitterObject
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string Description { get; set; }

            public Domain() { }
            public Domain(dynamic input)
            {
                Id = input.id;
                Name = input.name;
                Description = input.description;
                OriginalObject = input;
                OriginalObject = input;
            }
        }

        public class Entity : TwitterObject
        {
            public string Id { get; set; }
            public string Name { get; set; }

            public Entity() { }
            public Entity(dynamic input)
            {
                Id = input.id;
                Name = input.name;
                OriginalObject = input;
            }
        }    
    }
}
