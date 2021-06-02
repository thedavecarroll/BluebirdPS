function Get-TwitterListTweets {
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    param(

        [Parameter(Mandatory,ParameterSetName='ListId')]
        [string]$ListId,

        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerScreenName')]
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerId')]
        [ValidateNotNullOrEmpty()]
        [string]$Slug,
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerScreenName')]
        [ValidateNotNullOrEmpty()]
        [string]$OwnerScreenName,
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerId')]
        [ValidateNotNullOrEmpty()]
        [long]$OwnerId,

        [long]$SinceId,
        [long]$MaxId,

        [ValidateRange(1,200)]
        [long]$Count = 20,
        [switch]$ExcludeEntities,
        [switch]$ExcludeRetweets
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/lists/statuses.json',
        $Query
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters | ConvertTo-Json -Depth 10 | ConvertFrom-Json

}
