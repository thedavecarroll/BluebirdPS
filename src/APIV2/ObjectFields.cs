using System.Collections.Generic;

namespace BluebirdPS.APIV2
{
    public static class ObjectFields
    {
        public static List<string> TweetFields => new List<string>()
        {
            // default fields
            "id","text","edit_history_tweet_ids",

            // additional fields
            "attachments","author_id","context_annotations","conversation_id",
            "created_at","entities","geo","in_reply_to_user_id","lang","possibly_sensitive",
            "public_metrics","referenced_tweets","reply_settings","source","withheld","edit_controls"

            // possible metrics fields
            //  non_public_metrics
            //  organic_metrics
            //  promoted_metrics
        };

        public static List<string> UserFields => new List<string>()
        {
            // default fields
            "id","name","username",

            // additional fields
            "created_at","description","entities","location","pinned_tweet_id",
            "profile_image_url","protected","public_metrics","url","verified","withheld"
        };

        public static List<string> MediaFields => new List<string>()
        {
            // default fields
            "media_key","type",

            // additional fields
            "duration_ms","height","width","preview_image_url","url","alt_text","public_metrics","variants"

            // possible metrics fields
            //  non_public_metrics
            //  organic_metrics
            //  promoted_metrics
        };

        public static List<string> PollFields => new List<string>()
        {
            // default fields
            "id","options",

            // additional fields
            "duration_minutes","end_datetime","voting_status"
        };

        public static List<string> PlaceFields => new List<string>()
        {
            // default fields
            "id","full_name",

            // additional fields
            "contained_within","country","country_code","geo","name","place_type"
        };

        public static List<string> ListFields => new List<string>()
        {
            // default fields
            "id","name",

            // additional fields
            "created_at","description","follower_count","member_count","private","owner_id"
        };
        public static string GetFieldList(string objectType, bool nonPublicMetrics = false, bool organicMetrics = false, bool promotedMetrics = false)
        {
            List<string> fieldList = new List<string>();
            switch (objectType)
            {
                case "Tweet":
                    fieldList.AddRange(TweetFields);
                    break;
                case "User":
                    fieldList.AddRange(UserFields);
                    break;
                case "Media":
                    fieldList.AddRange(MediaFields);
                    break;
                case "Poll":
                    fieldList.AddRange(PollFields);
                    break;
                case "Place":
                    fieldList.AddRange(PlaceFields);
                    break;
                case "List":
                    fieldList.AddRange(ListFields);
                    break;
            }

            if (objectType == "Tweet" || objectType == "Media")
            {
                if (nonPublicMetrics)
                {
                    fieldList.Add("non_public_metrics");
                }
                if (organicMetrics)
                {
                    fieldList.Add("organic_metrics");
                }
                if (promotedMetrics)
                {
                    fieldList.Add("promoted_metrics");
                }
            }

            return string.Join(",", fieldList);
        }

    }
}