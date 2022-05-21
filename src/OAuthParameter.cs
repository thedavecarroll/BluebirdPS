using System;

namespace BluebirdPS
{
    internal class OAuthParameter : IComparable<OAuthParameter>
    {
        public OAuthParameter(string name,
                              string value,
                              bool isEncoded)
        {
            if (!isEncoded)
            {
                EncodedName = Uri.EscapeDataString(name);
                EncodedValue = Uri.EscapeDataString(value);
            }
            else
            {
                EncodedName = name;
                EncodedValue = value;
            }
        }

        public string EncodedName { get; }
        public string EncodedValue { get; }

        public int CompareTo(OAuthParameter other)
        {
            var nameComparison = string.CompareOrdinal(EncodedName, other.EncodedName);

            if (nameComparison == 0)
            {
                return string.CompareOrdinal(EncodedValue, other.EncodedValue);
            }

            return nameComparison;
        }

        public override string ToString()
        {
            return $"{EncodedName}={EncodedValue}";
        }

        public string ToHeaderString()
        {
            return $"{EncodedName}=\"{EncodedValue}\"";
        }
    }

}
