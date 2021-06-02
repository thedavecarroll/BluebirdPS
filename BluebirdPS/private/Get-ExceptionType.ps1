function Get-ExceptionType {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ErrorCategory
    )

    switch ($ErrorCategory) {
        'AuthenticationError'                           { return 'AuthenticationException' }
        {$_ -in 'InvalidOperation','OperationStopped',
        'NotImplemented' }                              { return 'InvalidOperationException' }
        {$_ -in 'InvalidArgument','InvalidData' }       { return 'InvalidArgumentException' }
        {$_ -in 'LimitsExceeded','QuotaExceeded' }      { return 'LimitsExceededException' }
        {$_ -in 'PermissionDenied','ResourceBusy',
        'ResourceUnavailable' }                         { return 'ResourceViolationException' }
        'ObjectNotFound'                                { return 'ResourceNotFoundException' }
        'SecurityError'                                 { return 'SecurityException' }
        'ConnectionError'                               { return 'ConnectionException' }
        default                                         { return 'UnspecifiedException'}
    }

}
