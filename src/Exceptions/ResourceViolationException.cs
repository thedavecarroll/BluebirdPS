using System;

namespace BluebirdPS.Exceptions
{
    public class ResourceViolationException : Exception
    {
        public ResourceViolationException(string message) : base(message)
        {

        }

    }
}