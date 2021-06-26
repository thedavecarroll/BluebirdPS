function Get-TwitterList {
    [CmdletBinding(DefaultParameterSetName='ByListUserName')]
    param(
        [Parameter(ParameterSetName='ByListUserName')]
        [string]$UserName,
        [Parameter(ParameterSetName='ByListUserName')]
        [switch]$OwnedListFirst,

        [Parameter(Mandatory,ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='BySlug')]
        [ValidateNotNullOrEmpty()]
        [string]$Slug,
        [Parameter(ParameterSetName='BySlug')]
        [ValidateNotNullOrEmpty()]
        [string]$OwnerUserName,

        [Parameter(Mandatory,ParameterSetName='ByFullName')]
        [ValidateNotNullOrEmpty()]
        [string]$FullName
    )

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/lists/show.json'
    }

    switch ($PSCmdlet.ParameterSetName) {
        'ByListUserName' {
            $Request.Endpoint = 'https://api.twitter.com/1.1/lists/list.json'
            if ($UserName -ne [String]::Empty) {
                $Request.Query.Add('screen_name', $UserName)
            }
            if ($OwnedListFirst.IsPresent) {
                $Request.Query.Add( 'reverse', $true)
            }
        }
        'ById' {
            $Request.Query.Add( 'list_id', $Id )
        }
        'BySlug' {
            $Request.Query.Add( 'slug', $Slug)
            if ($PSBoundParameters.ContainsKey('OwnerUserName')) {
                $Request.Query.Add('owner_screen_name', $OwnerUserName)
            } else {
                $Request.Query.Add('owner_screen_name', $BluebirdPSConfiguration.AuthUserName)
            }
        }
        'ByFullName' {
            $UserName, $Slug = $FullName.Split('/')
            $Request.Query.Add( 'slug', $Slug)
            $Request.Query.Add( 'owner_screen_name', $UserName.Replace('^@',''))
        }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
