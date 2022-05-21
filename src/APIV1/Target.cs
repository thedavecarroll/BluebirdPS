using System.Collections.Generic;
using System.Reflection;

namespace BluebirdPS.APIV1
{
    public class Target
    {
        public string Id { get; private set; }
        public string UserName { get; private set; }
        public bool Following { get; private set; }
        public bool FollowedBy { get; private set; }
        public bool FollowingReceived { get; private set; }
        public bool FollowingRequested { get; private set; }

        public Target(dynamic input)
        {
            Id = input.id_str;
            UserName = input.screen_name;
            Following = input.following;
            FollowedBy = input.followed_by;
            FollowingReceived = input.following_received;
            FollowingRequested = input.following_requested;
        }

        public override string ToString()
        {
            List<string> sourceDetails = new List<string>();
            PropertyInfo[] properties = typeof(Target).GetProperties();
            foreach (PropertyInfo property in properties)
            {
                if (property.PropertyType.Name == "Boolean")
                {
                    if ((bool)property.GetValue(this))
                    {
                        sourceDetails.Add(property.Name);
                    }
                }
            }
            return sourceDetails.Count > 1 ? $"{UserName} : {string.Join(", ", sourceDetails)}" : $"{UserName} : None";
        }

    }
}