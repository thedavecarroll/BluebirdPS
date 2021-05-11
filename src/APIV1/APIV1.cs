using System;
using System.Collections.Generic;

namespace BluebirdPS.APIV1
{
    public class List : TwitterObject
    {
        public string Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Slug { get; set; }
        public string Name { get; set; }
        public string FullName { get; set; }
        public string Description { get; set; }
        public string Uri { get; set; }
        public long MemberCount { get; set; }
        public long SubscriberCount { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public bool Following { get; set; }

        public List() { }
        public List(dynamic input)
        {
            try
            {
                OriginalObject = input;

                Id = input.id_str;
                CreatedAt = Helpers.ConvertV1Date(input.created_at);
                Slug = input.slug;
                Name = input.name;
                FullName = input.full_name;
                Description = input.description;
                Uri = input.uri;
                MemberCount = input.member_count;
                SubscriberCount = input.subscriber_count;
                Following = input.following;

                UserId = input.user.id_str;
                UserName = input.user.screen_name;
            }
            catch { }
        }

    }

    public class DirectMessage : TwitterObject
    {
        public string Id { get; set; }
        public string SenderId { get; set; }
        public string RecipientId { get; set; }
        public string SourceApp { get; set; }
        public string CreatedAt { get; set; }       
        public string Message { get; set; }
        public List<object> Entities { get; set; }
        public List<Media> Media { get; set; }
        public string SourceAppName { get; set; }
        public string SourceAppId { get; set; }
        public Uri SourceAppUrl { get; set; }

        public DirectMessage() { }
        public DirectMessage(dynamic input) 
        {
            OriginalObject = input;

            Id = input.id;
            SenderId = input.sender_id;
            RecipientId = input.target.reciptient;
        }
    }

    public class Media : TwitterObject
    {
        //id
        //id_str
        //indices
        //media_url
        //media_url_https
        //url
        //display_url
        //expanded_url
        //type
        //sizesid
        //id_str
        //indices
        //media_url
        //media_url_https
        //url
        //display_url
        //expanded_url
        //type
        //sizes
        //    large
        //    small
        //    medium
        //    thumb
        //        w
        //        h
        //        resize
    }

    public class SavedSearch : TwitterObject
    {
        public string Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Name { get; set; }
        public string Query { get; set; }

        public SavedSearch() { }
        public SavedSearch(dynamic input) {
            OriginalObject = input;

            Id = input.id_str;
            CreatedAt = Helpers.ConvertV1Date(input.created_at);
            Name = input.name;
            Query = input.query;
        }
    }

    public class AccountSettings : TwitterObject
    {
        public TimeZoneInfo TimeZoneInfo { get; set; }
        public bool Protected { get; set; }
        public string UserName { get; set; }
        public string Language { get; set; }
        public bool AlwaysUseHttps { get; set; }
        public bool UseCookiePersonalization { get; set; }
        public bool DiscoverableByEmail { get; set; }
        public bool DiscoverableByMobilePhone { get; set; }
        public bool DisplaySensitiveMedia { get; set; }
        public string AllowContributorRequest { get; set; }
        public string AllowDMsFrom { get; set; }
        public string AllowDMGroupsFrom { get; set; }
        public bool GeoEnabled { get; set; }
        public string TranslatorType { get; set; }
        public object SleepTime { get; set; }
        public List<object> TrendLocation { get; set; }

        public AccountSettings() { }
        public AccountSettings(dynamic input)
        {
            OriginalObject = input;

            TimeZoneInfo = GetTimeZoneInfo(input);
            Protected = input.@protected;
            UserName = input.screen_name;
            Language = input.language;
            AlwaysUseHttps = input.always_use_https;
            UseCookiePersonalization = input.use_cookie_personalization;
            DiscoverableByEmail = input.discoverable_by_email;
            DiscoverableByMobilePhone = input.discoverable_by_mobile_phone;
            DisplaySensitiveMedia = input.display_sensitive_media;
            AllowContributorRequest = input.allow_contributor_request;
            AllowDMsFrom = input.allow_dms_from;
            AllowDMGroupsFrom = input.allow_dm_groups_from;
            GeoEnabled = input.geo_enabled;
            TranslatorType = input.translator_type;
            SleepTime = input.sleep_time;
            TrendLocation = input.trendlocation;
        }

        private TimeZoneInfo GetTimeZoneInfo(dynamic input)
        {
            string timeZoneName = input.time_zone.tzinfo_name;
            string timeZoneDisplayName = input.time_zone.name;
            TimeSpan offset = new TimeSpan(0, 0, int.Parse(input.time_zone.utc_offset.ToString()));

            return TimeZoneInfo.CreateCustomTimeZone(timeZoneName, offset, timeZoneDisplayName, null);
        }

    }

}
