function Test-TwitterListSubscription {
    [OutputType('System.Boolean')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List,

        [BluebirdPS.APIV2.UserInfo.User]$User
    )

    if (-Not $PSBoundParameters.ContainsKey('User')) {
        $User = Get-TwitterUser
    }

    $UserSubscriptions = Get-TwitterListSubscription -User $User
    $List.Id -in $UserSubscriptions.Id
}
