function Remove-TwitterListMember {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [BluebirdPS.APIV1.List]$List,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1,100)]
        [string[]]$UserName
    )

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Query = @{ 'screen_name' = $UserName -join ',' }
    }

    if ($UserName.Count -gt 1) {
        $Request.Endpoint = 'https://api.twitter.com/1.1/lists/members/destroy_all.json'
        if ($UserName.Count -le 5) {
            $UserInfo = 'UserNames: {0}, Total Users: {1}' -f ($UserName -join ','),$UserName.Count
        } else {
            $UserInfo = 'UserNames: {0}, Total Users: {1}' -f ($UserName[0..4] -join ','),$UserName.Count
        }
    } else {
        $Request.Endpoint = 'https://api.twitter.com/1.1/lists/members/destroy.json'
        $UserInfo = 'UserName: {0}' -f $UserName
    }

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $Request.Query.Add('list_id',$Id)
            $ListInfo = 'Id: {0}' -f $Id
        }
        'ByList' {
            $Request.Query.Add('list_id',$List.Id)
            $ListInfo = 'Id: {0}, Name: {1}' -f $List.Id,$List.Name
        }
    }

    $Target = '{0} - {1}' -f $ListInfo,$UserInfo
    if ($PSCmdlet.ShouldProcess($Target, 'Remove users from list')) {
        Invoke-TwitterRequest -RequestParameters $Request
    }

}
