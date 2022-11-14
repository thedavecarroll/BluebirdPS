function Remove-TwitterListMember {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById')]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The List Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList')]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List,

        [Parameter(ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1,100)]
        [BluebirdPS.APIV2.UserInfo.User[]]$User
    )

    begin {
        if ($PSCmdlet.ParameterSetName -eq 'ById') {
            $ListId = $Id
            $List = Get-TwitterList -Id $Id
        } else {
            $ListId = $List.Id
        }
        if ($List.OwnerId -ne $BluebirdPSConfiguration.AuthUserId) {
            'You must be the owner of a list to remove members.' | Write-Error -ErrorAction Stop
        }
    }

    process {
        foreach ($RemoveMember in $User) {
            if (Test-TwitterListMembership -List $List -User $RemoveMember) {
                $Request = [TwitterRequest]@{
                    HttpMethod = 'DELETE'
                    Endpoint ='https://api.twitter.com/2/lists/{0}/members/{1}' -f $ListId,$RemoveMember.Id
                }
                $Request.SetCommandName('Remove-TwitterListMember')
                try {
                    $RemoveTwitterListMember = Invoke-TwitterRequest -RequestParameters $Request
                    if ($RemoveTwitterListMember) {
                        'User {0} removed from list {1}' -f $RemoveMember.Name,$List.ToShortString()
                    } else {
                        'User {0} was not removed from list {1}' -f $RemoveMember.Name,$List.ToShortString()
                    }
                }
                catch {
                    $PSCmdlet.ThrowTerminatingError($_)
                }
            } else {
                'User {0} is not a member of list {1}' -f $RemoveMember.Name,$List.ToShortString()
            }
        }
    }

}
