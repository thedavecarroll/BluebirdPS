function Get-TwitterList {
    [CmdletBinding(DefaultParameterSetName='List')]
    param(
        [Parameter(ParameterSetName='List')]
        [string]$ScreenName,
        [Parameter(ParameterSetName='List')]
        [string]$UserId,
        [Parameter(ParameterSetName='List')]
        [switch]$OwnedListFirst,

        [Parameter(Mandatory,ParameterSetName='ShowId')]
        [string]$ListId,

        [Parameter(Mandatory,ParameterSetName='ShowSlug')]
        [string]$Slug,
        [Parameter(ParameterSetName='ShowSlug')]
        [string]$OwnerScreenName,
        [Parameter(ParameterSetName='ShowSlug')]
        [long]$OwnerId
    )

    switch($PSCmdlet.ParameterSetName) {
        'List' {
            $Query = [hashtable]::new()
            if ($ScreenName) {
                $Query.Add('screen_name',$ScreenName)
            }
            if ($UserId) {
                $Query.Add('user_id',$UserId)
            }
            if ($PSBoundParameters.ContainsKey('OwnedListFirst')) {
                $Query.Add('reverse','true')
            }

            $OAuthParameters = [OAuthParameters]::new(
                'Get',
                'https://api.twitter.com/1.1/lists/list.json',
                $Query
            )

            Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        }
        'ShowId' {
            $Query = [hashtable]::new()
            $Query.Add('list_id',$ListId)
            $OAuthParameters = [OAuthParameters]::new(
                'Get',
                'https://api.twitter.com/1.1/lists/show.json',
                $Query
            )

            Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        }
        'ShowSlug' {
            $SlugOwnerMessage = 'You must provide the Slug''s owner via the OwnerScreenName or OwnerId parameters'
            $SlugOwnerRequired = 'You must provide the Slug''s owner.'

            $ValidationErrorRecord = @{
                Message = $null
                Parameter = 'Owner Parameters'
                ErrorId = 'OwnerScreenNameOrOwnerId'
            }

            if (-Not ($PSBoundParameters.ContainsKey('OwnerScreenName')) -and (-Not $PSBoundParameters.ContainsKey('OwnerId'))) {
                $ValidationErrorRecord.Message = '{0}.' -f $SlugOwnerMessage
            } elseif ($PSBoundParameters.ContainsKey('OwnerScreenName') -and $PSBoundParameters.ContainsKey('OwnerId')) {
                $ValidationErrorRecord.Message = '{0}, but not both.' -f $SlugOwnerMessage
            } else {
                if ($PSBoundParameters.ContainsKey('OwnerScreenName') -and [string]::IsNullOrWhiteSpace($OwnerScreenName)) {
                    $ValidationErrorRecord.Message = $SlugOwnerRequired
                }
                if ($PSBoundParameters.ContainsKey('OwnerId') -and [string]::IsNullOrWhiteSpace($OwnerId)) {
                    $ValidationErrorRecord.Message = $SlugOwnerRequired
                }
            }
            if ($null -ne $ValidationErrorRecord.Message) {
                $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
            }

            $Query = [hashtable]::new()
            $Query.Add('slug',$Slug)
            if ($OwnerScreenName) {
                $Query.Add('owner_screen_name',$OwnerScreenName)
            }
            if ($OwnerId) {
                $Query.Add('owner_id',$OwnerId)
            }

            $OAuthParameters = [OAuthParameters]::new(
                'Get',
                'https://api.twitter.com/1.1/lists/show.json',
                $Query
            )

            Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        }
    }
}