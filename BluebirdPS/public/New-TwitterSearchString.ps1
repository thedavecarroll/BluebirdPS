function New-TwitterSearchString {
    [Alias('New-TwitterSearch')]
    [CmdletBinding()]
    param(
        [string[]]$Hashtag,
        [string[]]$Words,
        [string]$Phrase,
        [string[]]$From,
        [string[]]$To,
        [string[]]$Mention,
        [string]$Url,
        [string]$Language,
        [int]$MinLikes,
        [int]$MinReplies,
        [int]$MinRetweets,
        [TwitterSearchFilter]$WithFilter,
        [TwitterSearchFilter]$WithoutFilter,
        [string]$FromList
    )

    $StringBuilder = [System.Text.StringBuilder]::new()

    foreach ($Key in ($PSBoundParameters.Keys -notin [System.Management.Automation.Cmdlet]::CommonParameters)) {
        $SearchKey = foreach ($Item in $PSBoundParameters[$Key]) {
            '{0}:{1}' -f $Key,$Item
        }
        $SearchKeyString = $SearchKey -join ' OR '
        $StringBuilder.Append($SearchKeyString)
    }
}