using System;

namespace BluebirdPS.Exceptions
{
    public class LimitsExceededException : Exception
    {
        public LimitsExceededException(string message) : base(message)
        {

        }

    }
}