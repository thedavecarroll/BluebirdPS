using System;
using System.Collections.Generic;
using System.Text;

namespace BluebirdPS.APIV1
{
    public class DirectMessage : TwitterObject
    {
        public string Id { get; set; }
        public string SenderId { get; set; }
        public string RecipientId { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Message { get; set; }
        //public PSObject Entities { get; set; }
        public Media Media { get; set; }
        public string SourceAppId { get; set; }
        //public string SourceAppName { get; set; }
        //public Uri SourceAppUrl { get; set; }

        public DirectMessage() { }
        public DirectMessage(dynamic @event)
        {
            OriginalObject = @event;

            try
            {
                dynamic messageMeta = @event;
                dynamic messageCreate = @event.message_create;

                Id = messageMeta.id;
                CreatedAt = Helpers.ConvertFromEpochTime(messageMeta.created_timestamp);

                SenderId = messageCreate.sender_id;
                RecipientId = messageCreate.target.recipient_id;
                SourceAppId = messageCreate.source_app_id;
                Message = messageCreate.message_data.text;

                //if (messageCreate.message_data.entities != null)
                //{
                //    Entities = messageCreate.message_data.entities;
                //}

                if (messageCreate.message_data.attachment.media != null)
                {
                    Media = new Media(messageCreate.message_data.attachment.media);
                }

            }
            catch { }

        }

        //{
        //  "event": {
        //    "type": "message_create",
        //    "id": "1395821428012953606",
        //    "created_timestamp": "1621624736203",
        //    "message_create": {
        //      "target": {
        //        "recipient_id": "2562312971"
        //      },
        //      "sender_id": "292670084",
        //      "source_app_id": "129032",
        //      "message_data": {
        //        "text": "Or PowerShell for that matter",
        //        "entities": {
        //          "hashtags": [],
        //          "symbols": [],
        //          "user_mentions": [],
        //          "urls": []
        //    }
        //}
        //    }
        //  },
        //  "apps": {
        //    "129032": {
        //        "id": "129032",
        //      "name": "Twitter for iPhone",
        //      "url": "http://twitter.com/download/iphone"
        //    }
        //}
    }


    public class Media : TwitterObject
    {
        public string Id { get; set; }
        public Uri MediaUrl { get; set; }
        public Uri Url { get; set; }
        public string DisplayUrl { get; set; }
        public Uri ExpandedUrl { get; set; }
        public string Type { get; set; }
        //public PSObject Sizes { get; set; }

        public Media(dynamic input)
        {
            try
            {
                Id = input.id_str;
                MediaUrl = new Uri(input.media_url_https);
                Url = new Uri(input.url);
                DisplayUrl = input.display_url;
                ExpandedUrl = new Uri(input.expanded_url);
                Type = Helpers.ToTitleCase(input.type);

                //Sizes = input.sizes;
            }
            catch
            {

            }
        }

        public override string ToString()
        {
            return $"Id: {Id}, Type: {Type}, DisplayUrl: {DisplayUrl}";
        }
        //sizes
        //    large
        //    small
        //    medium
        //    thumb
        //        w
        //        h
        //        resize
    }

    public class MediaSize : TwitterObject
    {
        public string Size { get; set; }
        public string Width { get; set; }
        public string Height { get; set; }
        public string Resize { get; set; }

        public MediaSize(dynamic input)
        {
            Size = input;
            Width = input.w;
            Height = input.h;
            Resize = Helpers.ToTitleCase(input.resize);
        }
    }

}
