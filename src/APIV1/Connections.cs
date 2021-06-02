using System;
using System.Collections.Generic;
using System.Text;
using BluebirdPS;

namespace BluebirdPS.APIV1
{
    public class FriendshipConnections : TwitterObject
    {
        public string Id { get; private set; }
        public string UserName { get; private set; }        
        public List<string> Connections { get; private set; } = new List<string>();
        
        public FriendshipConnections(dynamic input)
        {
            OriginalObject = input;

            UserName = input.screen_name;
            Id = input.id_str;

            foreach (string connection in input.connections)
            {
                Connections.Add(Helpers.ToTitleCase(connection).Replace("_",null));
            }
        }      
    }
}
