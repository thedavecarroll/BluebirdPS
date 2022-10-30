namespace BluebirdPS.APIV2.TweetInfo.Context {
    public class ContextAnnotation
    {
        public Domain Domain { get; set; }
        public Entity Entity { get; set; }

        public ContextAnnotation() { }
        public ContextAnnotation(dynamic input)
        {
            Domain = new Domain(input.domain);
            Entity = new Entity(input.entity);
        }

    }
}