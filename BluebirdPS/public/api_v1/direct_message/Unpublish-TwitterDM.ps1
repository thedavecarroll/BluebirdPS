function Unpublish-TwitterDM {
    [CmdLetBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Id,
        [Parameter(Mandatory,ParameterSetName='ByDM',ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [BluebirdPS.APIV1.DirectMessage]$TwitterDM
    )

    $DMId = $PSCmdlet.ParameterSetName -eq 'ById' ? $Id : $TwitterDM.Id
    $Request = [TwitterRequest]@{
        HttpMethod = 'DELETE'
        Endpoint = 'https://api.twitter.com/1.1/direct_messages/events/destroy.json'
        Query = @{ 'id' = $DMId}
    }

    if ($PSCmdlet.ShouldProcess($DMId, 'Removing direct message')) {
        Invoke-TwitterRequest -RequestParameters $Request | Out-Null
        if ($LastStatusCode -eq 204) {
            'Successfully deleted message with id {0} for you only. You cannot delete a message from another user`s direct messages.' -f $DMId
        }
    }

}
