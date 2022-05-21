using System.Collections.Generic;

namespace BluebirdPS.APIV2
{
    public static class ExpansionFields
    {
        public static List<string> Tweet => new List<string>()
        {
            "author_id","referenced_tweets.id","referenced_tweets.id.author_id",
            "entities.mentions.username","attachments.poll_ids","attachments.media_keys",
            "in_reply_to_user_id","geo.place_id"
        };

        public static List<string> User => new List<string>()
        {
            "pinned_tweet_id"
        };

        public static string GetExpansionFields(ExpansionTypes type)
        {
            string expansionFields = string.Empty;
            switch (type)
            {
                case ExpansionTypes.Tweet:
                    expansionFields = string.Join(",", Tweet);
                    break;
                case ExpansionTypes.User:
                    expansionFields = string.Join(",", User);
                    break;
            }
            return expansionFields;
        }

    }
}