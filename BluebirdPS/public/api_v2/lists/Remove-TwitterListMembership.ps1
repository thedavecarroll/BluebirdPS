function Remove-TwitterListMembership {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List
    )

    $User = Get-TwitterUser
    $MemberOfLists = Get-TwitterListMembership
    if (Test-TwitterListMembership -List $List -User $User) {
        $ListOwner = Get-TwitterUser -User $List.OwnerId
        if ($ListOwner.Id -eq $User.Id) {
            'You cannot use this command to remove yourself from a list you own. Instead, use Remove-TwitterListMember.' | Write-Warning
            return
        }
        if ($List.OwnerId -in $MemberOfLists.OwnerId) {
            foreach ($MemberOf in $MemberOfLists) {
                if ($List.Id -ne $MemberOf.Id) {
                    'You are also a member of {0} owned by {1}' -f $MemberOf.ToShortString(),$ListOwner.ToString() | Write-Warning
                }
            }
        }
        $ListOwner | Set-TwitterBlockedUser -Block | Out-Null
        $ListOwner | Set-TwitterBlockedUser -Unblock | Out-Null

        if (-Not (Test-TwitterListMembership -List $List -User $User)) {
            'Successfully removed from {0}' -f $List.ToShortString()
        }
    }

}
