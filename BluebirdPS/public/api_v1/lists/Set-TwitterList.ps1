function Set-TwitterList {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV1.List]$List,

        [Parameter()]
        [ValidatePattern('^([a-zA-Z0-9]|_|-){1,25}$', ErrorMessage = "The list name '{0}' is not valid. It must be 1-25 alphanumeric characters with underlines or dashes.")]
        [string]$Name,

        [ValidateNotNullOrEmpty()]
        [string]$Description,

        [ValidateSet('Private','Public')]
        [string]$Mode
    )

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/1.1/lists/update.json'
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

    $UpdatedProperties = 'Name','Description','Mode' | ForEach-Object {
        if ($PSBoundParameters.ContainsKey($_)) {
            if ($_ -eq 'Mode') {
                $Value = $PSBoundParameters[$_].ToString().ToLower()
            } else {
                $Value = $PSBoundParameters[$_]
            }
            $Request.Query.Add($_.ToLower(), $Value)
            $_
        }
    }

    if ($PSCmdlet.ShouldProcess(($UpdatedProperties -join ', '), ("Updating list {0} properties") -f $ListInfo)) {
        Invoke-TwitterRequest -RequestParameters $Request
    }
}
