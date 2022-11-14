using System;
using System.Collections.Generic;

namespace BluebirdPS.APIV1
{
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