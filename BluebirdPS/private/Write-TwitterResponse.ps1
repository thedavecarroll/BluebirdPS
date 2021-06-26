function Write-TwitterResponse {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ResponseData]$ResponseData
    )

    try {

        if ($ResponseData.RateLimitRemaining -eq 0) {
            $RateLimitReached = 'Rate limit of {0} has been reached. Please wait until {1} before making another attempt for this resource.' -f $ResponseData.RateLimit,$ResponseData.RateLimitReset
            $RateLimitReached | Write-Error -ErrorAction Stop
        }

        if (($ResponseData.RateLimitRemaining -le $BluebirdPSConfiguration.RateLimitThreshold -and $null -ne $ResponseData.RateLimitRemaining)) {
            $RateLimitMessage = 'The rate limit for this resource is {0}. There are {1} remaining calls to this resource until {2}. ' -f $ResponseData.RateLimit, $ResponseData.RateLimitRemaining, $ResponseData.RateLimitReset
            switch ($BluebirdPSConfiguration.RateLimitAction) {
                0 { $RateLimitMessage | Write-Verbose -Verbose; break}
                1 { $RateLimitMessage | Write-Warning -Warning; break}
                2 { $RateLimitMessage | Write-Error ; break}
            }
        }

        $BluebirdPSHistoryList.Add($ResponseData)
        Write-Information -MessageData $ResponseData

        switch ($BluebirdPSConfiguration.OutputType) {
            'PSCustomObject' {
                $ResponseData.ApiResponse
                return
            }
            'JSON' {
                $ResponseData.ApiResponse | ConvertTo-Json -Depth 25
                return
            }
        }

        if ($LastStatusCode -eq 401) {
            New-TwitterErrorRecord -ResponseData $ResponseData
        } else {
            switch ($ResponseData.ApiVersion) {
                'oauth2' {
                    # Set-TwitterBearerToken - the only endpoint that uses oauth2
                    $ResponseData.ApiResponse
                    break
                }
                '1.1' {
                    if ($ResponseData.Command -eq 'Set-TwitterMutedUser') {
                        # return nothing as the returned v1.1 user 'muting' property may not have been updated
                        # an error will still be returned if an attempt to unmute a user that hasn't been muted
                        continue
                    } else {
                        [Helpers]::ParseApiV1Response($ResponseData.ApiResponse)
                    }
                    break
                }
                '2' {
                    if ($ResponseData.ApiResponse.data.psobject.Properties.Name -contains 'following') {
                        [ResponseInfo]::GetUpdateFriendshipStatus($ResponseData)
                    } elseif ($ResponseData.ApiResponse.data.psobject.Properties.Name -contains 'blocking') {
                        [ResponseInfo]::GetUserBlockStatus($ResponseData)
                    } elseif ($ResponseData.ApiResponse.data.psobject.Properties.Name -contains 'liked') {
                        [ResponseInfo]::GetTweetLikeStatus($ResponseData)
                    } else {
                        [Helpers]::ParseApiV2Response($ResponseData.ApiResponse)
                    }
                    break
                }
            }
        }

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

    if ($ResponseData.ApiResponse.psobject.Properties.Name -contains 'errors') {
        New-TwitterErrorRecord -ResponseData $ResponseData
    }
}
