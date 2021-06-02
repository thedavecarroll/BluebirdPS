function Add-TwitterList {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidatePattern('^([a-zA-Z0-9]|_|-){1,25}$', ErrorMessage = "The list name '{0}' is not valid. It must be 1-25 alphanumeric characters with underlines or dashes.")]
        [string]$Name,

        [ValidateNotNullOrEmpty()]
        [string]$Description,

        [ValidateSet('Private','Public')]
        [string]$Mode = 'Public'
    )

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/1.1/lists/create.json'
        Query = @{
            'name' = $Name
            'mode' =  $Mode.ToLower()
            'description' = $Description
        }
    }

    'Creating list {0} with mode {1}' -f $Name,$Mode | Write-Verbose
    Invoke-TwitterRequest -RequestParameters $Request
}
