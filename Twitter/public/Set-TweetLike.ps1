function Set-TweetLike {
    [CmdletBinding(DefaultParameterSetName='Like')]
    param(
        [Parameter(Mandatory)]
        [Alias('TweetId)')]
        [long]$Id,
        [Parameter(ParameterSetName='Like')]
        [switch]$Like,
        [Parameter(ParameterSetName='Unlike')]
        [switch]$Unlike,
        [switch]$ExcludeEntities
    )

    begin {
        if ($PSBoundParameters.ContainsKey('ExcludeEntities')) {
            $Entity = 'false'
        } else {
            $Entity = 'false'
        }

        if ($PSCmdlet.ParameterSetName -eq 'Like') {
            $OAuthParameters = [OAuthParameters]::new(
                'POST',
                'https://api.twitter.com/1.1/favorites/create.json',
                @{id = $Id; include_entities = $Entity}
            )
        } else {
            $OAuthParameters = [OAuthParameters]::new(
                'POST',
                'https://api.twitter.com/1.1/favorites/destroy.json',
                @{id = $Id; include_entities = $Entity}
            )
        }
    }
    process {
        Invoke-TwitterRequest -OAuthParameters $OAuthParameters
    }

}