function Add-TwitterSavedSearch {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString
    )

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/1.1/saved_searches/create.json'
        Query = @{ query = $SearchString }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
