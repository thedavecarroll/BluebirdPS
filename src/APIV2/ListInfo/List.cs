using System;

namespace BluebirdPS.APIV2.ListInfo
{
    public class List : TwitterObject
    {
        public string Id { get; set; }
        public string Name  { get; set; }

        public DateTime CreatedAt { get; set; }
        public long FollowerCount { get; set; }
        public long MemberCount { get; set; }
        public string Description { get; set; }
        public bool Private { get; set; }
        public string OwnerId { get; set; }

        public List() { }
        public List(dynamic input)
        {
            try
            {
                OriginalObject = input;

                Id = input.id;
                CreatedAt = input.created_at;
                Name = input.name;
                Description = input.description;
                Private = input.@private;
                MemberCount = input.member_count;
                FollowerCount = input.follower_count;
                OwnerId = input.owner_id;
            }
            catch  { }
        }

        public override string ToString()
        {
            string strDescription = ! String.IsNullOrEmpty(Description) ? $", Description: {Description}" : string.Empty;
            return $"Id: {Id}, Name: {Name}, Members: {MemberCount}, Followers: {FollowerCount}, Created: {CreatedAt}{strDescription}";
        }

        public string ToShortString()
        {
            return $"Id: {Id}, Name: {Name}";
        }
    }
}