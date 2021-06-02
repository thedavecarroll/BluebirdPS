function Get-TwitterFriendship {
    [CmdletBinding(DefaultParameterSetName='Lookup')]
    param(
        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='Lookup')]
        [ValidateCount(1,100)]
        [string[]]$UserName,

        [Parameter(Mandatory,ParameterSetName='Show')]
        [string]$SourceUserName,

        [Parameter(Mandatory,ParameterSetName='Show')]
        [string]$TargetUserName,

        [Parameter(ParameterSetName='Incoming')]
        [switch]$Incoming,

        [Parameter(ParameterSetName='Pending')]
        [switch]$Pending,

        [Parameter(ParameterSetName='NoRetweets')]
        [switch]$NoRetweets

    )

    $Query = @{}

    switch -Regex ($PSCmdlet.ParameterSetName) {
        'Lookup' {
            $Endpoint = 'https://api.twitter.com/1.1/friendships/lookup.json'
            $Query.Add('screen_name',($UserName -join ','))
        }
        'Show' {
            $Endpoint = 'https://api.twitter.com/1.1/friendships/show.json'
            $Query.Add('source_screen_name',$SourceUserName)
            $Query.Add('target_screen_name',$TargetUserName)
        }
        'Incoming' {
            $Endpoint = 'https://api.twitter.com/1.1/friendships/incoming.json'
        }
        'Pending' {
            $Endpoint = 'https://api.twitter.com/1.1/friendships/outgoing.json'
        }
        'NoRetweets' {
            $Endpoint = 'https://api.twitter.com/1.1/friendships/no_retweets/ids.json'
        }
    }

    $Request = [TwitterRequest]@{
        Endpoint = $Endpoint
        Query = $Query
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
