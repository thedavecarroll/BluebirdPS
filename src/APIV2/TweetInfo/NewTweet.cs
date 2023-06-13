using BluebirdPS.APIV2.Objects;
using BluebirdPS.APIV2.TweetInfo.Metrics;
using BluebirdPS.APIV2.TweetInfo.Context;
using System;
using System.Collections.Generic;
using System.Management.Automation;

namespace BluebirdPS.APIV2.TweetInfo
{
    public class NewTweet : TwitterObject
    {
        public string Id { get; set; }
        public string Text { get; set; }

        public List<string> EditHistoryTweetIds { get; set; } = new List<string>();

        public NewTweet() { }
        public NewTweet(dynamic input)
        {
            OriginalObject = input;

            Id = input.id;
            Text = input.text;

            foreach (string editTweetIds in input.edit_history_tweet_ids)
            {
                EditHistoryTweetIds.Add(editTweetIds);
            }

        }

        public override string ToString()
        {
            return $"{Id}:{Text}";
        }

    }
}