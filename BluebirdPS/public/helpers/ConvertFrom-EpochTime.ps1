function ConvertFrom-EpochTime {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$UnixTime
    )

    if ($UnixTime.Length -eq 10) {
        [DateTimeOffset]::FromUnixTimeSeconds([long]::Parse($UnixTime)).ToLocalTime().DateTime
    } else {
        [DateTimeOffset]::FromUnixTimeMilliseconds([long]::Parse($UnixTime)).ToLocalTime().DateTime
    }
}
