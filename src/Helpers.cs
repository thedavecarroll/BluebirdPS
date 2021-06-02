using System;
using System.Collections.Generic;
using System.Globalization;
using System.Management.Automation;
using BluebirdPS.APIV2.MediaInfo;
using BluebirdPS.APIV2.TweetInfo;
using BluebirdPS.APIV2.UserInfo;
using BluebirdPS.APIV2.Objects;
using System.Collections;

namespace BluebirdPS
{
    public class Helpers
    {
        public static bool HasProperty(PSObject input, string propertyName)
        {
            return input != null && input.Properties[propertyName] != null;
        }

        public static string ToTitleCase(string input)
        {
            return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(input);
        }
        
        public static DateTime? ConvertFromV1Date(string input)
        {
            return input != null ? (DateTime?)DateTime.ParseExact(input, "ddd MMM dd HH:mm:ss zzz yyyy", CultureInfo.CurrentCulture) : null;

        }

        public static DateTime? ConvertFromEpochTime(string input)
        {
            try
            {
                return input.Length == 10
                    ? DateTimeOffset.FromUnixTimeSeconds(long.Parse(input)).ToLocalTime().DateTime
                    : DateTimeOffset.FromUnixTimeMilliseconds(long.Parse(input)).ToLocalTime().DateTime;

            }
            catch
            {
                return null;
            }
        }

        public static string ConvertToV1Date(DateTime input)
        {
            return input != null ? input.ToUniversalTime().ToString("s", CultureInfo.InvariantCulture) + "Z" : null;
        }

        public static List<object> ParseApiV2Response(dynamic input)
        {
            List<object> twitterResponse = new List<object>();

            if (HasProperty(input, "data"))
            {
                if (input.data is Array)
                {
                    foreach (dynamic twitterObject in input.data)
                    {
                        if (HasProperty(twitterObject, "username"))
                        {
                            twitterResponse.Add(new User(twitterObject));
                        }
                        else if (HasProperty(twitterObject, "text"))
                        {
                            twitterResponse.Add(new Tweet(twitterObject));
                        }
                    }
                }
                else
                {
                    if (HasProperty(input.data, "username"))
                    {
                        twitterResponse.Add(new User(input.data));
                    }
                    else if (HasProperty(input.data, "text"))
                    {
                        twitterResponse.Add(new Tweet(input.data));
                    }
                }
            }
            // parse includes
            if (HasProperty(input.includes, "tweets"))
            {
                foreach (dynamic tweet in input.includes.tweets)
                {
                    twitterResponse.Add(new Tweet(tweet));
                }
            }
            if (HasProperty(input.includes, "users"))
            {
                foreach (dynamic user in input.includes.users)
                {
                    twitterResponse.Add(new User(user));
                }
            }
            if (HasProperty(input.includes, "media"))
            {
                foreach (dynamic thisMedia in input.includes.media)
                {
                    twitterResponse.Add(new Media(thisMedia));
                }
            }
            if (HasProperty(input.includes, "polls"))
            {
                foreach (dynamic poll in input.includes.polls)
                {
                    twitterResponse.Add(new Poll(poll));
                }
            }

            return twitterResponse;
        }

        public static List<object> ParseApiV1Response(dynamic input)
        {
            List<object> twitterResponse = new List<object>();

            if (input is Array)
            {
                foreach (dynamic twitterObject in input)
                {
                    if (HasProperty(twitterObject, "lists") || HasProperty(twitterObject, "member_count"))
                    {
                        twitterResponse.Add(new APIV1.List(twitterObject));
                    }
                    else if (HasProperty(twitterObject, "connections"))
                    {
                        twitterResponse.Add(new APIV1.FriendshipConnections(twitterObject));
                    }
                    else if (HasProperty(twitterObject, "screen_name"))
                    {
                        twitterResponse.Add(new User(twitterObject));
                    }
                    else if (HasProperty(twitterObject, "query"))
                    {
                        twitterResponse.Add(new APIV1.SavedSearch(twitterObject));
                    }
                    else if (HasProperty(twitterObject, "in_reply_to_user_id_str"))
                    {
                        twitterResponse.Add(new Tweet(twitterObject));
                    }                    
                    else
                    {
                        twitterResponse.Add(twitterObject);
                    }
                }
            }
            else
            {
                if (HasProperty(input, "lists"))
                {
                    foreach (dynamic twitterObject in input.lists)
                    {
                        twitterResponse.Add(new APIV1.List(twitterObject));
                    }
                }
                else if (HasProperty(input, "discoverable_by_email"))
                {
                    twitterResponse.Add(new APIV1.AccountSettings(input));
                }
                else if (HasProperty(input, "relationship"))
                {
                    twitterResponse.Add(new APIV1.Relationship(input.relationship));
                }
                else if (HasProperty(input, "member_count"))
                {
                    twitterResponse.Add(new APIV1.List(input));
                }
                else if (HasProperty(input, "screen_name"))
                {
                    twitterResponse.Add(new User(input));
                }
                else if (HasProperty(input, "query"))
                {
                    twitterResponse.Add(new APIV1.SavedSearch(input));
                }
                else if (HasProperty(input, "ids"))
                {
                    twitterResponse.AddRange(input.ids);
                }
                else if (HasProperty(input, "events") || HasProperty(input, "event"))
                {
                    dynamic directMessages = null;
                    if (HasProperty(input, "events"))
                    {
                        directMessages = input.events;
                    }
                    else if (HasProperty(input, "event"))
                    {
                        directMessages = input.@event;
                    }
                    if (directMessages is IEnumerable)
                    {
                        foreach (dynamic message in directMessages)
                        {
                            twitterResponse.Add(new APIV1.DirectMessage(message));
                        }
                    } else
                    {
                        twitterResponse.Add(new APIV1.DirectMessage(directMessages));
                    }
                                       
                }
                else if (HasProperty(input, "users"))
                {
                    foreach (dynamic user in input.users)
                    {
                        twitterResponse.Add(new User(user));
                    }
                }
                //else if (HasProperty(input, "text"))
                //{
                //    twitterResponse.Add(new Tweet(input));
                //}
                else
                {
                    if (!HasProperty(input, "errors"))
                    {
                        twitterResponse.Add(input);
                    }
                }
            }

            return twitterResponse;
        }
            
    }
}
