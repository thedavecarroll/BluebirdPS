namespace BluebirdPS.APIV2
{
    public enum TweetFields
    {
        id,      // default
        text,    //default
        attachments,
        author_id,
        context_annotations,
        conversation_id,
        created_at,
        entities,
        geo,
        in_reply_to_user_id,
        lang,
        //non_public_metrics,
        //organic_metrics,
        possibly_sensitive,
        //promoted_metrics,
        public_metrics,
        referenced_tweets,
        reply_settings,
        source,
        withheld
    }

    public enum UserFields
    {
        id,         // default
        name,       // default
        username,   // default
        created_at,
        description,
        entities,
        location,
        pinned_tweet_id,
        profile_image_url,
        @protected,
        public_metrics,
        url,
        verified,
        withheld
    }

    public enum MediaFields
    {
        media_key,   // default
        type,        // default
        duration_ms,
        height,
        non_public_metrics,
        //organic_metrics,
        preview_image_url,
        //promoted_metrics,
        public_metrics,
        width
    }

    public enum PollFields
    {
        id,         // default
        options,    // default
        duration_minutes,
        end_datetime,
        voting_status
    }

    public enum PlaceFields
    {
        full_name,      // default
        id,             // default
        contained_within,
        country,
        country_code,
        geo,
        name,
        place_type
    }

}
