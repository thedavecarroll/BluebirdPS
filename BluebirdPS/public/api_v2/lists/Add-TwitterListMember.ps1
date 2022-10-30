function Add-TwitterListMember {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById')]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The List Id '{0}' is not valid.")]
        [Alias('ListId')]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList')]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List,

        [Parameter(ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
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
        foreach ($NewMember in $User) {
            $Request = [TwitterRequest]@{
                HttpMethod = 'POST'
                Endpoint ='https://api.twitter.com/2/lists/{0}/members' -f $ListId
                Body = [PSCustomObject]@{'user_id' = $NewMember.Id } | ConvertTo-Json
            }
            $Request.SetCommandName('Add-TwitterListMember')
            try{
                $AddTwitterListMember = Invoke-TwitterRequest -RequestParameters $Request
                $IsMember = $AddTwitterListMember ? 'is' : 'is not'
                'User {0} {1} a member of list {2}' -f $NewMember.Name,$IsMember,$List.ToShortString()
            }
            catch {
                $PSCmdlet.ThrowTerminatingError($_)
            }
        }
    }

}
