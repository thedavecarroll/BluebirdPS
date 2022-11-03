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
    }

    process {
        foreach ($RemoveMember in $User) {
            $Request = [TwitterRequest]@{
                HttpMethod = 'DELETE'
                Endpoint ='https://api.twitter.com/2/lists/{0}/members/{1}' -f $ListId,$RemoveMember.Id
            }
            $Request.SetCommandName('Remove-TwitterListMember')
            try {
                $RemoveTwitterListMember = Invoke-TwitterRequest -RequestParameters $Request
                $IsMember = $RemoveTwitterListMember ? 'is' : 'is not'
                'User {0} {1} a member of list {2}' -f $RemoveMember.Name,$IsMember,$List.ToShortString()
            }
            catch {
                $PSCmdlet.ThrowTerminatingError($_)
            }
        }
    }

}
