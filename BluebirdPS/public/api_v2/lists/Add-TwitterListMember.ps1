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

        [Parameter(Mandatory,ValueFromPipeline)]
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
        if ($List.OwnerId -ne $BluebirdPSConfiguration.AuthUserId) {
            'You must be the owner of a list to add members.' | Write-Error -ErrorAction Stop
        }
    }

    process {
        foreach ($NewMember in $User) {
            if (Test-TwitterListMembership -List $List -User $NewMember) {
                'User {0} is already a member of list {1}' -f $NewMember.Name,$List.ToShortString()
            } else {
                $Request = [TwitterRequest]@{
                    HttpMethod = 'POST'
                    Endpoint ='https://api.twitter.com/2/lists/{0}/members' -f $ListId
                    Body = [PSCustomObject]@{'user_id' = $NewMember.Id } | ConvertTo-Json
                }
                $Request.SetCommandName('Add-TwitterListMember')
                try{
                    $AddTwitterListMember = Invoke-TwitterRequest -RequestParameters $Request
                    if ($AddTwitterListMember) {
                        'User {0} added to list {1}' -f $NewMember.Name,$List.ToShortString()
                    } else {
                        'User {0} was not added to list {1}' -f $NewMember.Name,$List.ToShortString()
                    }
                }
                catch {
                    $PSCmdlet.ThrowTerminatingError($_)
                }
            }
        }
    }

}
