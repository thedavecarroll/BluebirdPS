using System.Text.RegularExpressions;
using System.Collections.Generic;
using BluebirdPS.APIV2.MediaInfo;
using BluebirdPS.APIV2.TweetInfo;
using BluebirdPS.APIV2.UserInfo;
using BluebirdPS.APIV2.Objects;
using System.Collections;
using System;
using System.Management.Automation;

namespace BluebirdPS
{
    public class ResponseInfo
    {
        private static string GetUserFromBody(ResponseData response)
        {
            Regex r = new Regex(@"(?<target>\d+)");
            Match m = r.Match(response.Body);
            return m.Groups["target"].Value;
        }

        private static string GetUserFromSegment(ResponseData response)
        {
            return response.Uri.Segments[5].Replace("/", null);
        }

        public static string SetUpdateFriendshipStatus(ResponseData response)
        {
            string following = response.Command == "Add-TwitterFriend" ? GetUserFromBody(response) : GetUserFromSegment(response);
            bool isPending = Helpers.HasProperty(response.ApiResponse.data, "pending_follow") ? (bool)response.ApiResponse.data.pending_follow : false;
            string pending = isPending ? $" There is a pending follow: {response.ApiResponse.data.pending_follow}" : null;
            return $"Following user {following}: {response.ApiResponse.data.following}.{pending}";
        }

        public static PSObject UsersFollowingCreateResponse(ResponseData response)
        {
            return response.ApiResponse.data;
        }

        public static bool UsersFollowingDeleteResponse(ResponseData response)
        {
            return response.ApiResponse.data.following;
        }

        public static bool BlockUserMutationResponse(ResponseData response)
        {
            return response.ApiResponse.data.blocking;
        }

        public static string SetTweetLikeStatus(ResponseData response)
        {
            string liked = response.HttpMethod == HttpMethod.POST ? GetUserFromBody(response) : GetUserFromSegment(response);
            return $"Likes tweet {liked}: {response.ApiResponse.data.liked}";
        }

        public static string ListCreateResponse(ResponseData response)
        {
            return response.ApiResponse.data.id;
        }

        public static string ListDeleteResponse(ResponseData response)
        {
            return response.ApiResponse.data.deleted;
        }

        public static string ListUpdateResponse(ResponseData response)
        {
            return response.Uri.Segments[3];
        }

        public static bool ListMutateResponse(ResponseData response)
        {
            return response.ApiResponse.data.is_member;
        }

        public static bool MuteUserMutationResponse(ResponseData response)
        {
            return response.ApiResponse.data.muting;
        }

        public static bool ListPinnedResponse(ResponseData response)
        {
            return response.ApiResponse.data.pinned;
        }

        public static List<object> Get2UsersIdFollowedListsResponse(ResponseData response)
        {
            List<object> twitterResponse = new List<object>();
            foreach (dynamic twitterObject in response.ApiResponse.data) {
                twitterResponse.Add(new APIV2.ListInfo.List(twitterObject));
            }
            if (Helpers.HasProperty(response.ApiResponse.includes, "users"))
            {
                foreach (dynamic user in response.ApiResponse.includes.users)
                {
                    twitterResponse.Add(new APIV2.UserInfo.User(user));
                }
            }
            return twitterResponse;
        }

        public static List<object> ParseApiV2Response(dynamic input)
        {
            List<object> twitterResponse = new List<object>();

            if (Helpers.HasProperty(input, "data"))
            {
                if (input.data is Array)
                {
                    foreach (dynamic twitterObject in input.data)
                    {
                        if (Helpers.HasProperty(twitterObject, "username"))
                        {
                            twitterResponse.Add(new APIV2.UserInfo.User(twitterObject));
                        }
                        else if (Helpers.HasProperty(twitterObject, "text"))
                        {
                            twitterResponse.Add(new APIV2.TweetInfo.Tweet(twitterObject));
                        }
                        else if (Helpers.HasProperty(twitterObject, "tweet_count"))
                        {
                            twitterResponse.Add(new APIV2.TweetInfo.TweetCount(twitterObject));
                        }
                        else if (Helpers.HasProperty(twitterObject, "member_count"))
                        {
                            twitterResponse.Add(new APIV2.ListInfo.List(twitterObject));
                        }
                    }
                }
                else
                {
                    if (Helpers.HasProperty(input.data, "username"))
                    {
                        twitterResponse.Add(new APIV2.UserInfo.User(input.data));
                    }
                    else if (Helpers.HasProperty(input.data, "text"))
                    {
                        twitterResponse.Add(new APIV2.TweetInfo.Tweet(input.data));
                    }
                    else if (Helpers.HasProperty(input.data, "text"))
                    {
                        twitterResponse.Add(new APIV2.TweetInfo.TweetCount(input.data));
                    }
                    else if (Helpers.HasProperty(input.data, "member_count"))
                    {
                        twitterResponse.Add(new APIV2.ListInfo.List(input.data));
                    }
                }
            }
            // parse includes
            if (Helpers.HasProperty(input.includes, "tweets"))
            {
                foreach (dynamic tweet in input.includes.tweets)
                {
                    twitterResponse.Add(new APIV2.TweetInfo.Tweet(tweet));
                }
            }
            if (Helpers.HasProperty(input.includes, "users"))
            {
                foreach (dynamic user in input.includes.users)
                {
                    twitterResponse.Add(new APIV2.UserInfo.User(user));
                }
            }
            if (Helpers.HasProperty(input.includes, "media"))
            {
                foreach (dynamic thisMedia in input.includes.media)
                {
                    twitterResponse.Add(new APIV2.MediaInfo.Media(thisMedia));
                }
            }
            if (Helpers.HasProperty(input.includes, "polls"))
            {
                foreach (dynamic poll in input.includes.polls)
                {
                    twitterResponse.Add(new APIV2.Objects.Poll(poll));
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
                    if (Helpers.HasProperty(twitterObject, "lists") || Helpers.HasProperty(twitterObject, "member_count"))
                    {
                        twitterResponse.Add(new APIV1.List(twitterObject));
                    }
                    else if (Helpers.HasProperty(twitterObject, "connections"))
                    {
                        twitterResponse.Add(new APIV1.FriendshipConnections(twitterObject));
                    }
                    else if (Helpers.HasProperty(twitterObject, "screen_name"))
                    {
                        twitterResponse.Add(new User(twitterObject));
                    }
                    else if (Helpers.HasProperty(twitterObject, "query"))
                    {
                        twitterResponse.Add(new APIV1.SavedSearch(twitterObject));
                    }
                    else if (Helpers.HasProperty(twitterObject, "in_reply_to_user_id_str"))
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
                if (Helpers.HasProperty(input, "lists"))
                {
                    foreach (dynamic twitterObject in input.lists)
                    {
                        twitterResponse.Add(new APIV1.List(twitterObject));
                    }
                }
                else if (Helpers.HasProperty(input, "discoverable_by_email"))
                {
                    twitterResponse.Add(new APIV1.AccountSettings(input));
                }
                else if (Helpers.HasProperty(input, "relationship"))
                {
                    twitterResponse.Add(new APIV1.Relationship(input.relationship));
                }
                else if (Helpers.HasProperty(input, "member_count"))
                {
                    twitterResponse.Add(new APIV1.List(input));
                }
                else if (Helpers.HasProperty(input, "screen_name"))
                {
                    twitterResponse.Add(new User(input));
                }
                else if (Helpers.HasProperty(input, "query"))
                {
                    twitterResponse.Add(new APIV1.SavedSearch(input));
                }
                else if (Helpers.HasProperty(input, "ids"))
                {
                    twitterResponse.AddRange(input.ids);
                }
                else if (Helpers.HasProperty(input, "events") || Helpers.HasProperty(input, "event"))
                {
                    dynamic directMessages = null;
                    if (Helpers.HasProperty(input, "events"))
                    {
                        directMessages = input.events;
                    }
                    else if (Helpers.HasProperty(input, "event"))
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
                else if (Helpers.HasProperty(input, "users"))
                {
                    foreach (dynamic user in input.users)
                    {
                        twitterResponse.Add(new User(user));
                    }
                }
                //else if (Helpers.HasProperty(input, "text"))
                //{
                //    twitterResponse.Add(new Tweet(input));
                //}
                else
                {
                    if (!Helpers.HasProperty(input, "errors"))
                    {
                        twitterResponse.Add(input);
                    }
                }
            }

            return twitterResponse;
        }

        //public static string GetUserMuteStatus(ResponseData response)
        //{
        //    // return nothing as the returned v1.1 user 'muting' property may not have been updated
        //    // an error will still be returned if an attempt to unmute a user that hasn't been muted
        //    return $"Muting user {response.ApiResponse.screen_name}: {response.ApiResponse.muting}";
        //}

    }
}
