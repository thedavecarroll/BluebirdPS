using System;
using System.Collections.Generic;
using System.Globalization;
using System.Management.Automation;
using BluebirdPS.APIV2.MediaInfo;
using BluebirdPS.APIV2.TweetInfo;
using BluebirdPS.APIV2.UserInfo;
using BluebirdPS.APIV2.Objects;
using System.Linq;

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
        public static DateTime ConvertV1Date(string input)
        {
            return DateTime.ParseExact(input, "ddd MMM dd HH:mm:ss zzz yyyy", CultureInfo.CurrentCulture);
        }

        public static List<object> ParseApiV2Response(dynamic input)
        {
            List<object> twitterResponse = new List<object>();

            if (HasProperty(input, "errors"))
            {
                // throw exceptions
            }

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
                    else if (HasProperty(twitterObject, "screen_name"))
                    {
                        twitterResponse.Add(new User(twitterObject));
                    }
                    else if (HasProperty(twitterObject, "query"))
                    {
                        twitterResponse.Add(new APIV1.SavedSearch(twitterObject));
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
                else if (HasProperty(input, "users"))
                {
                    foreach (dynamic user in input.users)
                    {
                        twitterResponse.Add(new User(user));
                    }
                }
                else
                {
                    twitterResponse.Add(input);
                }
            }

            return twitterResponse;
        }
    }
}
