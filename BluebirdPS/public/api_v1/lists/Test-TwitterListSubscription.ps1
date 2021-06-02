function Test-TwitterListSubscription {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [BluebirdPS.APIV1.List]$List,

        [ValidateNotNullOrEmpty()]
        [string]$UserName
    )

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/lists/subscribers/show.json'
        Query = @{ 'include_entities' = 'false'; 'skip_status' = 'true' }
    }

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $Request.Query.Add('list_id',$Id)
        }
        'ByList' {
            $Request.Query.Add('list_id',$List.Id)
        }
    }

    if ($PSBoundParameters.ContainsKey('UserName')) {
        $Request.Query.Add( 'screen_name', $UserName )
    } else {
        $Request.Query.Add( 'screen_name', $BluebirdPSConfiguration.AuthUserName )
    }

    try {
        Invoke-TwitterRequest -RequestParameters $Request | Out-Null
        $true
    }
    catch {
        $false
    }
}
