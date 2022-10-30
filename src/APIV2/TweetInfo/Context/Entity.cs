namespace BluebirdPS.APIV2.TweetInfo.Context
{
    public class Entity
    {
        public string Id { get; set; }
        public string Name { get; set; }

        public Entity() { }
        public Entity(dynamic input)
        {
            Id = input.id;
            Name = input.name;
        }

        public override string ToString()
        {
            return Name;
        }
    }
}