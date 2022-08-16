using System;
using System.Globalization;
using System.Management.Automation;

namespace BluebirdPS
{
    public class Helpers
    {
        public static bool HasProperty(PSObject input, string propertyName)
        {
            return input != null && input.Properties[propertyName] != null;
        }

        public static string ToTitleCase(string input)
        {
            return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(input);
        }

        public static DateTime? ConvertFromV1Date(string input)
        {
            return input != null ? (DateTime?)DateTime.ParseExact(input, "ddd MMM dd HH:mm:ss zzz yyyy", CultureInfo.CurrentCulture) : null;
        }

        public static DateTime? ConvertFromEpochTime(string input)
        {
            try
            {
                return input.Length == 10
                    ? DateTimeOffset.FromUnixTimeSeconds(long.Parse(input)).ToLocalTime().DateTime
                    : DateTimeOffset.FromUnixTimeMilliseconds(long.Parse(input)).ToLocalTime().DateTime;

            }
            catch
            {
                return null;
            }
        }

        public static string ConvertToV1Date(DateTime input)
        {
            return input != null ? input.ToUniversalTime().ToString("s", CultureInfo.InvariantCulture) + "Z" : null;
        }

    }
}
