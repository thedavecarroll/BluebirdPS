using BluebirdPS.APIV2.Objects;
using BluebirdPS.APIV2.TweetInfo.Metrics;
using BluebirdPS.APIV2.TweetInfo.Context;
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
        public List<string> EditHistoryTweetIds { get; set; } = new List<string>();
        public object EditControls { get; set; }
        public string Language { get; set; }
        public NonPublic NonPublicMetrics { get; set; }
        public Organic OrganicMetrics { get; set; }
        public bool PossiblySensitive { get; set; }
        public Promoted PromotedMetrics { get; set; }
        public Public PublicMetrics { get; set; }
        public List<ReferencedTweet> ReferencedTweets { get; set; }
        public string ReplySettings { get; set; }
        public string Source { get; set; }
        public WithheldContent Withheld { get; set; }

        public Tweet() { }
        public Tweet(dynamic input)
        {
            OriginalObject = input;

            Id = input.id;
            AuthorId = input.author_id;
            CreatedAt = input.created_at;
            ConversationId = input.conversation_id;
            PublicMetrics = new Public(input.public_metrics);
            InReplyToUserId = input.in_reply_to_user_id;
            Text = input.text;
            Entities = BaseEntity.GetEntities(input.entities);
            Language = input.lang;
            PossiblySensitive = input.possibly_sensitive;
            Source = input.source;
            Attachments = new Attachments(input.attachments);
            Geo = input.geo;
            ReplySettings = Helpers.ToTitleCase(input.reply_settings);
            Withheld = new WithheldContent(input.withheld);

            EditControls = new EditControls(input.edit_controls);
            foreach (string editTweetIds in input.edit_history_tweet_ids)
            {
                EditHistoryTweetIds.Add(editTweetIds);
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
                List<ContextAnnotation> contextAnnotations = new List<ContextAnnotation>();
                foreach (dynamic contextAnnotation in input.context_annotations)
                {
                    contextAnnotations.Add(new ContextAnnotation(contextAnnotation));
                }
                ContextAnnotations = contextAnnotations;
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

        public override string ToString()
        {
            return $"{Id}:{Text}";
        }

    }
}