function Get-ErrorCategory {
    [CmdletBinding(DefaultParameterSetName = 'APIV1.1')]
    param(
        [Parameter(Mandatory, ParameterSetName = 'APIV1.1')]
        [string]$StatusCode,
        [Parameter(Mandatory, ParameterSetName = 'APIV1.1')]
        [string]$ErrorCode,

        [Parameter(Mandatory, ParameterSetName = 'APIV2')]
        [string]$ErrorType
    )

    if ($PSCmdlet.ParameterSetName -eq 'APIV2') {
        switch ($ErrorType) {
            'about:blank'                                                    { return 'NotSpecified' }
            'https://api.twitter.com/2/problems/not-authorized-for-resource' { return 'PermissionDenied' }
            'https://api.twitter.com/2/problems/not-authorized-for-field'    { return 'PermissionDenied' }
            'https://api.twitter.com/2/problems/invalid-request'             { return 'InvalidArgument' }
            'https://api.twitter.com/2/problems/client-forbidden'            { return 'PermissionDenied' }
            'https://api.twitter.com/2/problems/disallowed-resource'         { return 'PermissionDenied' }
            'https://api.twitter.com/2/problems/unsupported-authentication'  { return 'AuthenticationError' }
            'https://api.twitter.com/2/problems/usage-capped'                { return 'QuotaExceeded' }
            'https://api.twitter.com/2/problems/streaming-connection'        { return 'ConnectionError' }
            'https://api.twitter.com/2/problems/client-disconnected'         { return 'ConnectionError' }
            'https://api.twitter.com/2/problems/operational-disconnect'      { return 'ResourceUnavailable' }
            'https://api.twitter.com/2/problems/rule-cap'                    { return 'QuotaExceeded' }
            'https://api.twitter.com/2/problems/invalid-rules'               { return 'InvalidArgument' }
            'https://api.twitter.com/2/problems/duplicate-rules'             { return 'InvalidOperation' }
            'https://api.twitter.com/2/problems/resource-not-found'          { return 'ObjectNotFound' }
        }

    } else {
        switch ($StatusCode) {
            400 {
                switch ($ErrorCode) {
                    324                    { return 'OperationStopped' }
                    325                    { return 'ObjectNotFound' }
                    { $_ -in 323, 110 }    { return 'InvalidOperation' }
                    215                    { return 'AuthenticationError' }
                    { $_ -in 3, 7, 8, 44 } { return 'InvalidArgument' }
                    407                    { return 'ResourceUnavailable' }
                }
            }
            401 {
                if ($ErrorCode -in 417, 135, 32, 416) {
                    return 'InvalidOperation'
                }
            }
            403 {
                switch ($ErrorCode) {
                    { $_ -in 326,453 }                  { return 'SecurityError' }
                    { $_ -in 200, 272, 160, 203, 431 }  { return 'InvalidOperation' }
                    { $_ -in 386, 205, 226, 327 }       { return 'QuotaExceeded' }
                    { $_ -in 99, 89 }                   { return 'AuthenticationError' }
                    { $_ -in 195, 92 }                  { return 'ConnectionError' }
                    { $_ -in 354, 186, 38, 120, 163 }   { return 'InvalidArgument' }
                    { $_ -in 214, 220, 261, 187, 349,
                        385, 415, 271, 185, 36, 63, 64,
                        87, 179, 93, 433, 139, 150, 151,
                        161, 425 }                       { return 'PermissionDenied' }
                }
            }
            404 {
                if ($ErrorCode -in 34, 108, 109, 422, 421, 13, 17, 144, 34, 50) {
                    return 'InvalidOperation'
                } elseif ($ErrorCode -eq 25) {
                    return 'InvalidArgument'
                }
            }
            406 {
                return 'InvalidData'
            }
            409 {
                if ($ErrorCode -eq 355) {
                    return 'InvalidOperation'
                }
            }
            410 {
                if ($ErrorCode -eq 68) {
                    return 'ConnectionError'
                } elseif ($ErrorCode -eq 251) {
                    return 'NotImplemented'
                }
            }
            415 {
                return 'LimitsExceeded'
            }
            420 {
                return 'QuotaExceeded'
            }
            422 {
                if ($ErrorCode -eq 404) {
                    return 'InvalidOperation'
                } else {
                    return 'InvalidArgument'
                }
            }
            429 {
                if ($ErrorCode -eq 88) {
                    return 'QuotaExceeded'
                }
            }
            500 {
                if ($ErrorCode -eq 131) {
                    return 'ResourceUnavailable'
                }
            }
            503 {
                if ($ErrorCode -eq 130) {
                    return 'ResourceBusy'
                }
            }
        }
    }

    return 'NotSpecified'
}
