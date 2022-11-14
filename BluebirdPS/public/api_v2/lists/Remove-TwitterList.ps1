function Remove-TwitterList {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The List Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $ListId = $Id
            $List = Get-TwitterList -Id $Id
        }
        'ByList' {
            $ListId = $List.Id
        }
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'DELETE'
        Endpoint = 'https://api.twitter.com/2/lists/{0}' -f $ListId
    }

    if ($PSCmdlet.ShouldProcess($List.ToString(), 'Removing List')) {
        Invoke-TwitterRequest -RequestParameters $Request
    }

}
