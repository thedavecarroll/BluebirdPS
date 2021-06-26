function Remove-TwitterList {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV1.List]$List
    )

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/1.1/lists/destroy.json'
    }

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $Request.Query.Add('list_id',$Id)
            $List = Get-TwitterList -Id $Id
        }
        'ByList' {
            $Request.Query.Add('list_id',$List.Id)
        }
    }

    if ($PSCmdlet.ShouldProcess($List.ToString(), 'Removing List')) {
        Invoke-TwitterRequest -RequestParameters $Request | Out-Null
    }
}
