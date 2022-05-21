using System.Collections.Generic;

namespace BluebirdPS.APIV2.TweetInfo
{
    public class Attachments : TwitterObject
    {
        public string Type { get; set; }
        public List<string> Ids { get; set; }

        public Attachments() { }
        public Attachments(dynamic input) {
            OriginalObject = input;

            try
            {
                List<string> attachments = new List<string>();

                if (Helpers.HasProperty(input, "poll_ids"))
                {
                    Type = "Poll";
                    foreach (string attachment in input.poll_ids)
                    {
                        attachments.Add(attachment);
                    }

                }
                else if (Helpers.HasProperty(input, "media_keys"))
                {
                    Type = "MediaInfo";
                    foreach (string attachment in input.media_keys)
                    {
                        attachments.Add(attachment);
                    }
                }
                Ids = attachments;
            }
            catch
            {

            }
        }

        public override string ToString()
        {
            return $"{Type}";
        }

    }
}