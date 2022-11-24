function Write-TwitterResponse {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ResponseData]$ResponseData
    )

    try {

        $BluebirdPSHistoryList.Add($ResponseData)
        Write-Information -MessageData $ResponseData

        [SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
        $global:BluebirdPSLastResponse = $ResponseData

        switch ($BluebirdPSConfiguration.OutputType) {
            'PSCustomObject' {
                $ResponseData.ApiResponse
                break
            }
            'JSON' {
                $ResponseData.ApiResponse | ConvertTo-Json -Depth 25
                break
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
                        [ResponseInfo]::ParseApiV1Response($ResponseData.ApiResponse)
                    }
                    break
                }
                '2' {
                    if ($ResponseData.ApiResponse.data) {
                        switch ($ResponseData.Command) {
                            'Add-TwitterFriend'             { [ResponseInfo]::UsersFollowingCreateResponse($ResponseData); break }
                            'Remove-TwitterFriend'          { [ResponseInfo]::UsersFollowingDeleteResponse($ResponseData); break }
                            'Set-TwitterBlockedUser'        { [ResponseInfo]::BlockUserMutationResponse($ResponseData); break }
                            'Set-TwitterMutedUser'          { [ResponseInfo]::MuteUserMutationResponse($ResponseData); break }
                            'Set-TweetLike'                 { [ResponseInfo]::SetTweetLikeStatus($ResponseData); break }
                            'Add-TwitterList'               { [ResponseInfo]::ListCreateResponse($ResponseData); break }
                            'Set-TwitterList'               { [ResponseInfo]::ListUpdateResponse($ResponseData); break }
                            'Remove-TwitterList'            { break }
                            'Add-TwitterListMember'         { [ResponseInfo]::ListMutateResponse($ResponseData); break }
                            'Remove-TwitterListMember'      { [ResponseInfo]::ListMutateResponse($ResponseData); break }
                            'Get-TwitterListSubscription'   { [ResponseInfo]::Get2UsersIdFollowedListsResponse($ResponseData); break }
                            'Set-TwitterPinnedList'         { [ResponseInfo]::ListPinnedResponse($ResponseData); break }
                            'Publish-Tweet'                 { $ResponseData.ApiResponse.data; break }
                            default                         { [ResponseInfo]::ParseApiV2Response($ResponseData.ApiResponse); break }
                        }
                        break
                    } else {
                        if ($LastStatusCode -in 403,404) {
                            New-TwitterErrorRecord -ResponseData $ResponseData
                        }
                    }
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
