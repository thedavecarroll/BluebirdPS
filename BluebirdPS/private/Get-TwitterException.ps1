function Get-TwitterException {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ExceptionType,
        [Parameter(Mandatory)]
        [string]$ErrorMessage
    )
    switch ($ExceptionType) {
        AuthenticationException    { return [AuthenticationException]::new($ErrorMessage) }
        InvalidOperationException  { return [InvalidOperationException]::new($ErrorMessage) }
        InvalidArgumentException   { return [InvalidArgumentException]::new($ErrorMessage) }
        LimitsExceededException    { return [LimitsExceededException]::new($ErrorMessage) }
        ResourceViolationException { return [ResourceViolationException]::new($ErrorMessage) }
        ResourceNotFoundException  { return [ResourceNotFoundException]::new($ErrorMessage) }
        SecurityException          { return [SecurityException]::new($ErrorMessage) }
        ConnectionException        { return [ConnectionException]::new($ErrorMessage) }
        UnspecifiedException       { return [UnspecifiedException]::new($ErrorMessage) }
        default                    { return [UnspecifiedException]::new($ErrorMessage) }
    }
}