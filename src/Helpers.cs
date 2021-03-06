using System;
using System.Collections.Generic;
using System.Globalization;
using System.Management.Automation;
using BluebirdPS.APIV2.Media;
using BluebirdPS.APIV2.TwitterTweet;
using BluebirdPS.APIV2.TwitterUser;
using BluebirdPS.APIV2.Objects;
using System.Linq;

namespace BluebirdPS
{
    public class Helpers
    {
        public enum TweetIncludes
        {
            All,
            Users,
            Tweets,
            Media,
            Polls,
            Places
        }

        public static bool HasProperty(PSObject input, string propertyName)
        {            
            return input.Properties[propertyName] != null;
        }

        public static DateTime ConvertV1Date(string input)
        {
            return DateTime.ParseExact(input, "ddd MMM dd HH:mm:ss zzz yyyy", CultureInfo.CurrentCulture);
        }

        public static string ToTitleCase(string input)
        {
            return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(input);
        }
    
        public static List<object> ParseResponse(dynamic input)
        {
            List<object> twitterResponse = new List<object>();
            
            if (HasProperty(input,"errors"))
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
                } else
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
            if (HasProperty(input, "includes"))
            {
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
            }

            return twitterResponse;
        }

        public static List<object> ParseResponseCondense(dynamic input)
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

            return twitterResponse;
        }

        public static string GetFieldList(string enumName)
        {
            string enumFullName = enumName.Contains("BluebirdPS.APIV2") ? enumName : $"BluebirdPS.APIV2.{enumName}";

            Type enumType = (from assembly in AppDomain.CurrentDomain.GetAssemblies()
                                let type = assembly.GetType(enumFullName)
                                where type != null
                                && type.IsEnum
                                select type).FirstOrDefault();            
            List<string> fieldNames = new List<string>(Enum.GetNames(enumType));
            return string.Join(",", fieldNames);
        }
    }
}
