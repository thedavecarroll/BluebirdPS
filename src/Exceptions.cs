using System;
using System.Management.Automation;
using System.Collections.Generic;
using System.Text;

namespace BluebirdPS
{
    public class AuthenticationException : Exception
    {
        public AuthenticationException(string message) : base(message)
        {
        }
    }

    public class InvalidOperationException : Exception
    {
        public InvalidOperationException(string message) : base(message)
        {
            
        }
    }

    public class InvalidArgumentException : Exception
    {
        public InvalidArgumentException(string message) : base(message)
        {

        }
    }
    public class LimitsExceededException : Exception
    {
        public LimitsExceededException(string message) : base(message)
        {

        }
    }
    public class ResourceViolationException : Exception
    {
        public ResourceViolationException(string message) : base(message)
        {

        }
    }
    public class ResourceNotFoundException : Exception
    {
        public ResourceNotFoundException(string message) : base(message)
        {

        }
    }
    public class SecurityException : Exception
    {
        public SecurityException(string message) : base(message)
        {

        }
    }
    public class ConnectionException : Exception
    {
        public ConnectionException(string message) : base(message)
        {

        }
    }

    public class UnspecifiedException : Exception
    {
        public UnspecifiedException(string message) : base(message)
        {

        }
    }
}
