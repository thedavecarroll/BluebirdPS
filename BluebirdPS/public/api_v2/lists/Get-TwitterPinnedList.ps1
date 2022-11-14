function Get-TwitterPinnedList {
    [OutputType('BluebirdPS.APIV2.ListInfo.List')]
    [CmdletBinding()]
    param()

    # this endpoint can return pinned lists for any user; this command needs to be updated.
    $Request = [TwitterRequest]@{
        Endpoint ='https://api.twitter.com/2/users/{0}/pinned_lists' -f $BluebirdPSConfiguration.AuthUserId
        ExpansionType = 'List'
    }

    Invoke-TwitterRequest -RequestParameters $Request
}