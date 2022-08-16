function Set-TwitterPinnedList {
    [CmdletBinding(DefaultParameterSetName='PinList')]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List,

        [Parameter(ParameterSetName='PinList')]
        [switch]$PinList,

        [Parameter(ParameterSetName='UnpinList')]
        [switch]$UnpinList
    )

    if ($PSCmdlet.ParameterSetName -eq 'PinList') {
        $Request = [TwitterRequest]@{
            HttpMethod = 'POST'
            Endpoint ='https://api.twitter.com/2/users/{0}/pinned_lists' -f $BluebirdPSConfiguration.AuthUserId
            Body = [PSCustomObject]@{ 'list_id' = $List.Id } | ConvertTo-Json
        }
    } else {
        $Request = [TwitterRequest]@{
            HttpMethod = 'DELETE'
            Endpoint ='https://api.twitter.com/2/users/{0}/pinned_lists/{1}' -f $BluebirdPSConfiguration.AuthUserId,$List.Id
        }
    }

    $SetTwitterPinnedList = Invoke-TwitterRequest -RequestParameters $Request
    $PinnedList = $SetTwitterPinnedList ? 'pinned' : 'not pinned'
    'List {0} is {1}' -f $List.ToShortString(),$PinnedList
}
