using System.Collections.Generic;

namespace BluebirdPS.APIV2.Objects
{
    public class BaseEntity : TwitterObject
    {
        public long Start { get; set; }
        public long End { get; set; }

        public static List<object> GetEntities(dynamic input)
        {
            List<object> entities = new List<object>();

            try
            {
                if (Helpers.HasProperty(input, "annotations"))
                {
                    foreach (dynamic annotation in input.annotations)
                    {
                        entities.Add(new Annotation(annotation));
                    }
                }
                if (Helpers.HasProperty(input, "cashtags"))
                {
                    foreach (dynamic cashtag in input.cashtags)
                    {
                        entities.Add(new CashTag(cashtag));
                    }
                }
                if (Helpers.HasProperty(input, "hashtags"))
                {
                    foreach (dynamic hashtag in input.hashtags)
                    {
                        entities.Add(new HashTag(hashtag));
                    }
                }
                if (Helpers.HasProperty(input, "mentions"))
                {
                    foreach (dynamic mention in input.mentions)
                    {
                        entities.Add(new Mention(mention));
                    }
                }
                if (Helpers.HasProperty(input, "urls"))
                {
                    foreach (dynamic url in input.urls)
                    {
                        entities.Add(new UrlTag(url));
                    }
                }
                if (Helpers.HasProperty(input, "url"))
                {
                    if (Helpers.HasProperty(input.url, "urls"))
                    {
                        foreach (dynamic url in input.url.urls)
                        {
                            entities.Add(new UrlTag(url));
                        }
                    }
                }
                if (Helpers.HasProperty(input, "description"))
                {
                    if (Helpers.HasProperty(input.description, "urls"))
                    {
                        foreach (dynamic url in input.description.urls)
                        {
                            entities.Add(new UrlTag(url));
                        }
                    }
                    if (Helpers.HasProperty(input.description, "annotations"))
                    {
                        foreach (dynamic annotation in input.description.annotations)
                        {
                            entities.Add(new Annotation(annotation));
                        }
                    }
                    if (Helpers.HasProperty(input.description, "cashtags"))
                    {
                        foreach (dynamic cashtag in input.description.cashtags)
                        {
                            entities.Add(new CashTag(cashtag));
                        }
                    }
                    if (Helpers.HasProperty(input.description, "hashtags"))
                    {
                        foreach (dynamic hashtag in input.description.hashtags)
                        {
                            entities.Add(new HashTag(hashtag));
                        }
                    }
                    if (Helpers.HasProperty(input.description, "mentions"))
                    {
                        foreach (dynamic mention in input.description.mentions)
                        {
                            entities.Add(new Mention(mention));
                        }
                    }
                }
            }
            catch
            {
                // any missing properties that are not on the input object
                // and not caught with Helpers.HasProperty if statement,
                // do not fail (for now)
            }
            return entities.Count > 0 ? entities : null;
        }

    }
}