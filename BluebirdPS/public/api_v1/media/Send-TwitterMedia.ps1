function Send-TwitterMedia {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateScript({Resolve-Path -Path $_})]
        [string]$Path,

        [Parameter(Mandatory)]
        [ValidateSet('TweetImage','TweetVideo','TweetGif','DMImage','DMVideo','DMGif')]
        [string]$Category,

        [ValidateLength(1,1000)]
        [string]$AltImageText
    )

    begin {

        $MediaFileInfo = Get-ChildItem $Path

        # get mime type by extension, see https://github.com/SCRT-HQ/PSGSuite/blob/master/PSGSuite/Private/Get-MimeType.ps1 for inspiration
        # there's nothing currently in .Net Core that could derive the type from the content
        $MediaMimeTypes = @{
            gif = 'image/gif'
            jpg = 'image/jpeg'
            jpeg = 'image/jpeg'
            png = 'image/png'
            webp = 'image/webp'
            mp4 = 'video/mp4'
            mov = 'video/quicktime'
        }
        $MimeType = $MediaMimeTypes[$MediaFileInfo.Extension.TrimStart('.')]

        # validate size of file
        # validate if detected mimetype matches category
        $SizeLimitExceededMessage = 'The size of media {0} exceeded the limit of {2} bytes. Please try again.'
        $CategoryMimeTypeMismatch = 'Category {0} does not match the media mimetype of {1}. Please try again.'
        $CategoryAltImgText = 'Category {0} does not allow the AltImageText. Please try again.'
        $ValidationErrorRecord = @{
            Message = [String]::Empty
            Target = $MediaFileInfo.Name
            ErrorId = $null
        }

        switch -regex ($Category) {
            'Image' {
                if ($MediaFileInfo.Length -gt 5MB) {
                    $ValidationErrorRecord.Message = $SizeLimitExceededMessage -f $Category,$MediaFileInfo.Name,5MB
                    $ValidationErrorRecord.ErrorId = 'SizeLimitExceeded'
                    $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
                }
                if ($MimeType -notmatch 'image') {
                    $ValidationErrorRecord.Message = $CategoryMimeTypeMismatch -f $Category,$MimeType
                    $ValidationErrorRecord.ErrorId = 'MediaCategoryMimeTypeMismatch'
                    $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
                }
                break
            }
            'Video' {
                if ($MediaFileInfo.Length -gt 512MB) {
                    $ValidationErrorRecord.Message = $SizeLimitExceededMessage -f $Category,$MediaFileInfo.Name,512MB
                    $ValidationErrorRecord.ErrorId = 'SizeLimitExceeded'
                    $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
                }
                if ($MimeType -notmatch 'video') {
                    $ValidationErrorRecord.Message = $CategoryMimeTypeMismatch -f $Category,$MimeType
                    $ValidationErrorRecord.ErrorId = 'MediaCategoryMimeTypeMismatch'
                    $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
                }
                break
            }
            'Gif' {
                if ($MediaFileInfo.Length -gt 15MB) {
                    $ValidationErrorRecord.Message = $SizeLimitExceededMessage -f $Category,$MediaFileInfo.Name,15MB
                    $ValidationErrorRecord.ErrorId = 'SizeLimitExceeded'
                    $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
                }
                if ($MimeType -ne 'image/gif') {
                    $ValidationErrorRecord.Message = $CategoryMimeTypeMismatch -f $Category,$MimeType
                    $ValidationErrorRecord.ErrorId = 'MediaCategoryMimeTypeMismatch'
                    $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
                }
                break
            }
        }

        if ($PSBoundParameters.ContainsKey('AltImageText') -and $MimeType -match 'video') {
            $ValidationErrorRecord.Message = $CategoryAltImgText -f $Category,$MimeType
            $ValidationErrorRecord.ErrorId = 'MediaCategoryNoSupportForAltImgText'
            $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
        }

        $MediaCategory = switch ($Category) {
            'TweetImage' { 'tweet_image' }
            'TweetVideo' { 'tweet_video' }
            'TweetGif'   { 'tweet_gif' }
            'DMImage'    { 'dm_image' }
            'DMVideo'    { 'dm_video' }
            'DMGif'      { 'dm_gif' }
        }
        $MediaUploadUrl = 'https://upload.twitter.com/1.1/media/upload.json'
        $TotalBytes = $MediaFileInfo.Length
    }

    process {

        'Reading file {0}' -f $MediaFileInfo.FullName | Write-Verbose
        # read the image into memory
        $BufferSize = 900000
        $Buffer = [Byte[]]::new($BufferSize)
        $Reader = [System.IO.File]::OpenRead($MediaFileInfo.FullName)
        $Media = [ArrayList]::new()
        do {
            $BytesRead = $Reader.Read($Buffer, 0 , $BufferSize)
            $null = $Media.Add([Convert]::ToBase64String($Buffer, 0, $BytesRead))
        } while ($BytesRead -eq $BufferSize)
        $Reader.Dispose()

        # ------------------------------------------------------------------------------------------
        # INIT phase
        'Beginning INIT phase - media size {0}, category {1}, type {2}' -f $TotalBytes,$MediaCategory,$MimeType | Write-Verbose
        $Request = [TwitterRequest]@{
            HttpMethod = 'POST'
            Endpoint = $MediaUploadUrl
            Form = @{
                command = 'INIT'
                total_bytes = $TotalBytes
                media_category = $MediaCategory
                media_type = $MimeType
            }
        }

        try {
            $SendMediaInitResult = Invoke-TwitterRequest -RequestParameters $Request -Verbose:$false
            if ($SendMediaInitResult-is [ErrorRecord]) {
                $PSCmdlet.ThrowTerminatingError($SendMediaInitResult)
            }
        }
        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }

        $MediaId = $SendMediaInitResult.'media_id'
        'Upload for media id {0} successfully initiated' -f $MediaId | Write-Verbose

        # ------------------------------------------------------------------------------------------
        # APPEND phase
        'Beginning APPEND phase' | Write-Verbose
        $Index = 0
        foreach ($Chunk in $Media) {

            $PercentComplete = (($Index + 1) / $Media.Count) * 100
            $Activity = "Uploading media file '{0}' with id {1}" -f $MediaFileInfo.Name,$MediaId
            $CurrentOperation = "Media chunk #{0}" -f $Index
            $Status = "{0}% Complete:" -f $PercentComplete
            Write-Progress -Activity $Activity -CurrentOperation $CurrentOperation -Status $Status -PercentComplete $PercentComplete

            $Request = [TwitterRequest]@{
                HttpMethod = 'POST'
                Endpoint = $MediaUploadUrl
                Form = @{
                    command = 'APPEND'
                    media_id = $MediaId
                    media_data = $Media[$Index]
                    segment_index = $Index
                }
            }

            $SendMediaAppendResult = Invoke-TwitterRequest -RequestParameters $Request -Verbose:$false

            if ($SendMediaAppendResult -is [ErrorRecord]) {
                $PSCmdlet.ThrowTerminatingError($SendMediaAppendResult)
            }
            $Index++
        }
        Write-Progress -Activity 'Media upload append phase completed' -Completed

        # ------------------------------------------------------------------------------------------
        # FINALIZE phase
        'Beginning FINALIZE phase' | Write-Verbose
        $Request = [TwitterRequest]@{
            HttpMethod = 'POST'
            Endpoint = $MediaUploadUrl
            Form = @{
                command = 'FINALIZE'
                media_id = $MediaId
            }
        }

        $SendMediaFinalizeResult = Invoke-TwitterRequest -RequestParameters $Request -Verbose:$false
        if ($SendMediaFinalizeResult -is [ErrorRecord]) {
            $PSCmdlet.ThrowTerminatingError($SendMediaFinalizeResult)
        }

        # ------------------------------------------------------------------------------------------
        # STATUS phase
        if ($SendMediaFinalizeResult.'processing_info'.'check_after_secs') {
            'Beginning STATUS phase' | Write-Verbose
            $WaitSeconds = $SendMediaFinalizeResult.'processing_info'.'check_after_secs' -as [int]
            $SendMediaStatus = Get-SendMediaStatus -MediaId $MediaId -WaitSeconds $WaitSeconds -Verbose:$false
            $SendMediaCompletionResults = $SendMediaStatus
        } else {
            $SendMediaCompletionResults = $SendMediaFinalizeResult
        }

        # ------------------------------------------------------------------------------------------
        # Add AltImageText phase
        if ($AltImageText.Length -gt 0) {
            'Adding AltImageText to media {0}' -f $MediaId | Write-Verbose
            Set-TwitterMediaAltImageText -MediaId $MediaId -AltImageText $AltImageText -Verbose:$false | Out-Null
            if ($LastStatusCode -eq '200') {
                'Alt image text successfully added to media' | Write-Verbose
            }
        }

        'Media upload complete' | Write-Verbose
        $SendMediaCompletionResults
    }

    end {

    }
}
