function Get-TwitterListTweets {
    [Alias('Get-TwitterListStatus')]
    [CmdletBinding(DefaultParameterSetName='ListId')]
    param(

        [Parameter(Mandatory,ParameterSetName='ListId')]
        [Alias('Id')]
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

        [ValidateRange(1,200)] # max 200 returned
        [long]$ResultsPerPage = 20, #assumption - API doc for this does not specify
        [switch]$SkipStatus,
        [switch]$ExcludeEntities,
        [switch]$ExcludeRetweets
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'Get',
        'https://api.twitter.com/1.1/lists/statuses.json',
        $Query
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters

}
