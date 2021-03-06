using System.Text.RegularExpressions;

namespace BluebirdPS.APIV2
{
    public class UpdateFriendship
    {
        public static string GetStatus(ResponseData response)
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

            string pending = Helpers.HasProperty(response.ApiResponse.data, "pending_follow") ?
                $" There is a pending follow: {response.ApiResponse.data.pending_follow}" :
                null;
            string message = $"{authUserId} is following {following}: {response.ApiResponse.data.following}.{pending}";
            return message;
        }
    }
}
