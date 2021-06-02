using System.Text.RegularExpressions;

namespace BluebirdPS
{
    public class ResponseInfo
    {
        public static string GetUpdateFriendshipStatus(ResponseData response)
        {
            string following = response.Command == "Add-TwitterFriend" ? GetUserFromBody(response) : GetUserFromSegment(response); 
            bool isPending = Helpers.HasProperty(response.ApiResponse.data, "pending_follow") ? (bool)response.ApiResponse.data.pending_follow : false;
            string pending = isPending ? $" There is a pending follow: {response.ApiResponse.data.pending_follow}" : null;
            return $"Following user {following}: {response.ApiResponse.data.following}.{pending}";
        }

        public static string GetUserBlockStatus(ResponseData response)
        {
            string blocking = response.HttpMethod == HttpMethod.POST ? GetUserFromBody(response) : GetUserFromSegment(response);
            return $"Blocking user {blocking}: {response.ApiResponse.data.blocking}";
        }

        public static string GetTweetLikeStatus(ResponseData response)
        {
            string liked = response.HttpMethod == HttpMethod.POST ? GetUserFromBody(response) : GetUserFromSegment(response);
            return $"Likes tweet {liked}: {response.ApiResponse.data.liked}";
        }

        //public static string GetUserMuteStatus(ResponseData response)
        //{
        //    // return nothing as the returned v1.1 user 'muting' property may not have been updated
        //    // an error will still be returned if an attempt to unmute a user that hasn't been muted
        //    return $"Muting user {response.ApiResponse.screen_name}: {response.ApiResponse.muting}";
        //}

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
    }
}
