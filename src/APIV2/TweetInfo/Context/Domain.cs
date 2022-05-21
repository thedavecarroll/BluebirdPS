namespace BluebirdPS.APIV2.TweetInfo.Context {
    public class Domain : TwitterObject
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public Domain() { }
        public Domain(dynamic input)
        {
            Id = input.id;
            Name = input.name;
            Description = input.description;
            OriginalObject = input;
            OriginalObject = input;
        }

    }
}