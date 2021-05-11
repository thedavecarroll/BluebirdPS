using System.Text.RegularExpressions;

namespace BluebirdPS.APIV2
{
    public class ResponseInfo
    {
        public static string GetUpdateFriendshipStatus(ResponseData response)
        {
            string authUserId = response.Uri.Segments[3].Replace("/", null);
            string following;
            if (response.Command == "Add-TwitterFriend")
            {
                Regex r = new Regex(@"(?<target>\d+)");
                Match m = r.Match(response.Body);
                following = m.Groups["target"].Value;
            }
            else
            {
                following = response.Uri.Segments[5].Replace("/", null);
            }

            bool isPending = Helpers.HasProperty(response.ApiResponse.data, "pending_follow") ? (bool)response.ApiResponse.data.pending_follow : false;
            string pending = isPending ? $" There is a pending follow: {response.ApiResponse.data.pending_follow}" : null;
            string message = $"{authUserId} is following {following}: {response.ApiResponse.data.following}.{pending}";
            return message;
        }

        public static string GetUserBlockStatus(ResponseData response)
        {
            string authUserId = response.Uri.Segments[3].Replace("/", null);
            string blocking;
            if (response.HttpMethod == HttpMethod.POST)
            {
                Regex r = new Regex(@"(?<target>\d+)");
                Match m = r.Match(response.Body);
                blocking = m.Groups["target"].Value;
            }
            else
            {
                blocking = response.Uri.Segments[5].Replace("/", null);
            }

            string message = $"{authUserId} is blocking {blocking}: {response.ApiResponse.data.blocking}.";
            return message;
        }

        public static string GetTweetLikeStatus(ResponseData response)
        {
            string authUserId = response.Uri.Segments[3].Replace("/", null);
            string liked;
            if (response.HttpMethod == HttpMethod.POST)
            {
                Regex r = new Regex(@"(?<target>\d+)");
                Match m = r.Match(response.Body);
                liked = m.Groups["target"].Value;
            }
            else
            {
                liked = response.Uri.Segments[5].Replace("/", null);
            }

            string message = $"{authUserId} liked {liked}: {response.ApiResponse.data.liked}.";
            return message;
        }

    }
}
