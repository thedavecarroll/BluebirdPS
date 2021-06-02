function Get-TwitterListSubscriber {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [BluebirdPS.APIV1.List]$List
    )

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/lists/subscribers.json'
        Query = @{
            'skip_status' = $true
            'include_entities' = $true
            'count' = 5000
        }
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

    'Getting subscribers for list: {0}' -f $ListInfo | Write-Verbose
    Invoke-TwitterRequest -RequestParameters $Request | Select-Object -ExpandProperty UserName
}
