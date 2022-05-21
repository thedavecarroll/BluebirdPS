using System.Collections.Generic;

namespace BluebirdPS.APIV2.Objects
{
    public class WithheldContent : TwitterObject
    {
        public bool Copyright { get; set; }
        public List<string> CountryCodes { get; set; }

        public WithheldContent() { }
        public WithheldContent(dynamic input)
        {
            if (input == null)
            {
                return;
            }
            Copyright = input.copyright;
            CountryCodes = input.country_codes;
            OriginalObject = input;
        }

    }
}