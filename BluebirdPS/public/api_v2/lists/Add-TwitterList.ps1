function Add-TwitterList {
    [OutputType('BluebirdPS.APIV2.ListInfo.List')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateLength(1,25)]
        [string]$Name,

        [ValidateLength(0,100)]
        [string]$Description,

        [switch]$Private
    )

    $Body = @{
        name = $Name
        private = $Private.IsPresent
    }
    if ($PSBoundParameters.ContainsKey('Description')) {
        $Body.Add('description',$Description)
    }
    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/2/lists'
        Body = [PSCustomObject]$Body | ConvertTo-Json
    }

    $AddTwitterList = Invoke-TwitterRequest -RequestParameters $Request
    if ($AddTwitterList) {
        Get-TwitterList -Id $AddTwitterList
    }

}
