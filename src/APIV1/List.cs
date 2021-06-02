using System;
using System.Collections.Generic;
using System.Text;

namespace BluebirdPS.APIV1
{
    public class List : TwitterObject
    {
        public string Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Slug { get; set; }
        public string Name { get; set; }
        public string FullName { get; set; }
        public string Description { get; set; }
        public string Uri { get; set; }
        public string Mode { get; set; }
        public long MemberCount { get; set; }
        public long SubscriberCount { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public bool Following { get; set; }

        public List() { }
        public List(dynamic input)
        {
            try
            {
                OriginalObject = input;

                Id = input.id_str;
                CreatedAt = Helpers.ConvertFromV1Date(input.created_at);
                Slug = input.slug;
                Name = input.name;
                FullName = input.full_name;
                Description = input.description;
                Uri = $"https://twitter.com{input.uri}";
                Mode = Helpers.ToTitleCase(input.mode);
                MemberCount = input.member_count;
                SubscriberCount = input.subscriber_count;
                Following = input.following;

                UserId = input.user.id_str;
                UserName = input.user.screen_name;
            }
            catch { }
        }

        public override string ToString()
        {
            return $"Name: {Name}, Members: {MemberCount}, Subscribers: {SubscriberCount}, Created: {CreatedAt}, Description: {Description}";
        }

    }

}
