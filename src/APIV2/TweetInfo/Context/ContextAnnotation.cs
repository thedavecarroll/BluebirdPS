namespace BluebirdPS.APIV2.TweetInfo.Context {
    public class ContextAnnotation : TwitterObject
    {
        public Domain Domain { get; set; }
        public Entity Entity { get; set; }

        ContextAnnotation() { }
        ContextAnnotation(dynamic input) {
            OriginalObject = input;
            if (Helpers.HasProperty(input, "domain"))
            {
                Domain = new Domain(input.domain);
            }
            if (Helpers.HasProperty(input, "entity"))
            {
                Entity = new Entity(input.entity);
            }
        }

    }
}