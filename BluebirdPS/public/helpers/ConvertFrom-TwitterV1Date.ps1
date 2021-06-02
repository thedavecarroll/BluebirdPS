function ConvertFrom-TwitterV1Date {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Date
    )

    try {
        [datetime]::ParseExact( $Date, "ddd MMM dd HH:mm:ss zzz yyyy", [CultureInfo]::InvariantCulture )
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}