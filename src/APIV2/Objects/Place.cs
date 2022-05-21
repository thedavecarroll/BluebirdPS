using System.Collections.Generic;
using System.Management.Automation;

namespace BluebirdPS.APIV2.Objects
{
    public class Place : TwitterObject
    {
        //https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/geo
        public string Fullname { get; set; }
        public string Id { get; set; }
        public List<string> ContainedWithin { get; set; }
        public string Country { get; set; }
        public string CountryCode { get; set; }
        public PSObject Geo { get; set; }
        public string Name { get; set; }
        public string PlaceType { get; set; }

        public Place() { }
        public Place(dynamic input) {

            OriginalObject = input;
        }

    }
}