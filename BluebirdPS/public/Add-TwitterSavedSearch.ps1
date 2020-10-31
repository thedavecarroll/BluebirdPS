function Add-TwitterSavedSearch {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString
    )

    $OAuthParameters = [OAuthParameters]::new(
        'POST',
        'https://api.twitter.com/1.1/saved_searches/create.json',
        @{ query = [System.Uri]::EscapeDataString($SearchString) }
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters

}
