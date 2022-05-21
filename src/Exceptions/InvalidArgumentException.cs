using System;

namespace BluebirdPS.Exceptions
{
    public class InvalidArgumentException : Exception
    {
        public InvalidArgumentException(string message) : base(message)
        {

        }

    }
}