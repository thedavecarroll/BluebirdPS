function Test-TwitterListMembership {
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

    $UserLists = Get-TwitterListMembership -User $User
    $List.Id -in $UserLists.Id
}
