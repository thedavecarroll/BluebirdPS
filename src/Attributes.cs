using System;
using System.Collections.Generic;
using System.Text;

namespace BluebirdPS
{
    public enum AttributeType
    {
        Condensed,
        Expansion,

    }

    [AttributeUsage(AttributeTargets.Property)]
    class TwitterAttribute : Attribute
    {
        private readonly AttributeType attributeType;

        public TwitterAttribute(AttributeType type)
        {
            attributeType = type;
        }

        public virtual AttributeType Type
        {
            get { return attributeType; }
        }
    }
}
