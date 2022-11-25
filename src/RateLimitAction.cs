namespace BluebirdPS
{
    public enum RateLimitAction
    {
        // type of output stream used to display a message
        // when the remaining calls are at the RateLimitThreshold or less

        Verbose,
        Warning,
        Error,
        Resume
    }

}
