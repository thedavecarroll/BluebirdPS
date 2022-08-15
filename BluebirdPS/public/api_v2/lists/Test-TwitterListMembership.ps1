function Test-TwitterListMembership {
    [OutputType('System.Boolean')]
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [Parameter(Mandatory)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List
    )

    if (-Not $PSBoundParameters.ContainsKey('User')) {
        $User = Get-TwitterUser
    }

    $UserLists = Get-TwitterListMembership -User $User
    $List.Id -in $UserLists.Id
}
