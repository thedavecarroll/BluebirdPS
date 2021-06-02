function Add-TwitterListSubscription {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [BluebirdPS.APIV1.List]$List
    )

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/1.1/lists/subscribers/create.json'
    }

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $Request.Query.Add( 'list_id', $Id )
            $ListInfo = 'Id: {0}' -f $Id
        }
        'ByList' {
            $Request.Query.Add( 'list_id', $List.Id )
            $ListInfo = 'Id: {0}, Name: {1}' -f $List.Id,$List.Name
        }
    }

    'Subscribing to list: {0}' -f $ListInfo | Write-Verbose
    Invoke-TwitterRequest -RequestParameters $Request | Out-Null
}
