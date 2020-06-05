using namespace System.Management.Automation
using namespace Collections.ObjectModel
using namespace System.Collections

function Send-TwitterMedia {
    [CmdletBinding()]
    [Alias('Send-Media')]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateScript({Resolve-Path -Path $_})]
        [string]$Path,

        [Parameter(Mandatory)]
        [ValidateSet('TweetImage','TweetVideo','TweetGif','DMImage','DMVideo','DMGif')]
        [string]$Category,

        [int[]]$AddOwners
    )

    # my first dynamic parameter, wooot!
    # it works, but intellisense is wacked - see https://github.com/PowerShell/PowerShell/issues/3984 for details
    <#
    DynamicParam {
        if ($Category -notmatch 'Video') {
            $AttribCollection = [Collection[Attribute]]::new()
            $AttribCollection.Add([ParameterAttribute]::new())
            $AttribCollection.Add([ValidateLengthAttribute]::new(1,1000))

            $Parameter = [RuntimeDefinedParameter]::new('AltImageText',[string],$AttribCollection)

            $Dictionary = [RuntimeDefinedParameterDictionary]::new()
            $Dictionary.add('AltImageText',$Parameter)

            return $Dictionary
        }
    }
    #>

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
                    New-ValidationErrorRecord @ValidationErrorRecord
                }
                if ($MimeType -notmatch 'image') {
                    $ValidationErrorRecord.Message = $CategoryMimeTypeMismatch -f $Category,$MimeType
                    $ValidationErrorRecord.ErrorId = 'MediaCategoryMimeTypeMismatch'
                    New-ValidationErrorRecord @ValidationErrorRecord
                }
                break
            }
            'Video' {
                if ($MediaFileInfo.Length -gt 512MB) {
                    $ValidationErrorRecord.Message = $SizeLimitExceededMessage -f $Category,$MediaFileInfo.Name,512MB
                    $ValidationErrorRecord.ErrorId = 'SizeLimitExceeded'
                    New-ValidationErrorRecord @ValidationErrorRecord
                }
                if ($MimeType -notmatch 'video') {
                    $ValidationErrorRecord.Message = $CategoryMimeTypeMismatch -f $Category,$MimeType
                    $ValidationErrorRecord.ErrorId = 'MediaCategoryMimeTypeMismatch'
                    New-ValidationErrorRecord @ValidationErrorRecord
                }
                break
            }
            'Gif' {
                if ($MediaFileInfo.Length -gt 15MB) {
                    $ValidationErrorRecord.Message = $SizeLimitExceededMessage -f $Category,$MediaFileInfo.Name,15MB
                    $ValidationErrorRecord.ErrorId = 'SizeLimitExceeded'
                    New-ValidationErrorRecord @ValidationErrorRecord
                }
                if ($MimeType -ne 'image/gif') {
                    $ValidationErrorRecord.Message = $CategoryMimeTypeMismatch -f $Category,$MimeType
                    $ValidationErrorRecord.ErrorId = 'MediaCategoryMimeTypeMismatch'
                    New-ValidationErrorRecord @ValidationErrorRecord
                }
                break
            }
        }

        if ($AddOwners.Count -gt 100) {
            $ValidationErrorRecord.Message ='You can only add up to 100 owners to media. Please try again with less owners.'
            $ValidationErrorRecord.ErrorId = 'TooManyOwnersProvided'
            $ValidationErrorRecord.Target = 'AddOwners Parameter'
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
        $AltImageTextUrl = 'https://upload.twitter.com/1.1/media/metadata/create.json'
        $TotalBytes = $MediaFileInfo.Length
        $AltImageTextBody = '{{"media_id":"{0}}}","alt_text":{{"text":"{1}"}}}}'
    }

    process {

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
        $OAuthParameters = [OAuthParameters]::new('POST',$MediaUploadUrl)
        $OAuthParameters.Form = @{
            command = 'INIT'
            total_bytes = $TotalBytes
            media_category = $MediaCategory
            media_type = $MimeType
        }
        if ($AddOwners.Count -gt 0) {
            $OAuthParameters.Form.Add(($AddOwners -join ','))
        }

        $SendMediaInitResult = Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        if ($SendMediaInitResult-is [ErrorRecord]) {
            $PSCmdlet.ThrowTerminatingError($SendMediaInitResult)
        }

        $MediaId = $SendMediaInitResult.'media_id'

        # ------------------------------------------------------------------------------------------
        # APPEND phase
        $Index = 0
        foreach ($Chunk in $Media) {
            $OAuthParameters = [OAuthParameters]::new('POST',$MediaUploadUrl)
            $OAuthParameters.Form = @{
                command = 'APPEND'
                media_id = $MediaId
                media_data = $Media[$Index]
                segment_index = $Index
            }
            $SendMediaAppendResult = Invoke-TwitterRequest -OAuthParameters $OAuthParameters
            if ($SendMediaAppendResult -is [ErrorRecord]) {
                $PSCmdlet.ThrowTerminatingError($SendMediaAppendResult)
            }
            $Index++
        }

        # ------------------------------------------------------------------------------------------
        # FINALIZE phase
        $OAuthParameters = [OAuthParameters]::new('POST',$MediaUploadUrl)
        $OAuthParameters.Form = @{
            command = 'FINALIZE'
            media_id = $MediaId
        }
        $SendMediaFinalizeResult = Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        if ($SendMediaFinalizeResult -is [ErrorRecord]) {
            $PSCmdlet.ThrowTerminatingError($SendMediaFinalizeResult)
        }

        # ------------------------------------------------------------------------------------------
        # STATUS phase
        if ($SendMediaFinalizeResult.'processing_info') {
            $WaitSeconds = $SendMediaFinalizeResult.'processing_info'.'check_after_secs'

            do {
                'Still processing, waiting {0} seconds before refreshing status.' -f $WaitSeconds | Write-Warning

                Start-Sleep -Seconds $WaitSeconds

                $Query = [hashtable]::new()
                $Query.Add('command','STATUS')
                $Query.Add('media_id',$MediaId)
                $OAuthParameters = [OAuthParameters]::new('GET',$MediaUploadUrl,$Query)

                $SendMediaStatus = Invoke-TwitterRequest -OAuthParameters $OAuthParameters
                if ($SendMediaStatus -is [ErrorRecord]) {
                    $PSCmdlet.ThrowTerminatingError($SendMediaStatus)
                }

                $WaitSeconds = $SendMediaStatus.'processing_info'.'check_after_secs'
                $SendMediaStatus | Format-List | Out-String | Write-Verbose

            } while ($SendMediaStatus.'processing_info'.'state' -eq 'in_progress')

            $SendMediaCompletionResults = $SendMediaStatus

        } else {
            $SendMediaCompletionResults = $SendMediaFinalizeResult
        }

        # ------------------------------------------------------------------------------------------
        # Add AltImageText phase
        if ($AltImageText.Length -gt 0) {
            $OAuthParameters = [OAuthParameters]::new('POST',$AltImageTextUrl)
            $OAuthParameters.Body = $AltImageTextBody -f $MediaId,$AltImageText

            $AddAltImageText = Invoke-TwitterRequest -OAuthParameters $OAuthParameters
            if ($AddAltImageText -is [ErrorRecord]) {
                $PSCmdlet.ThrowTerminatingError($AddAltImageText)
            }
            $AddAltImageText | Format-List | Out-StringWrite-Verbose
        }

        $SendMediaCompletionResults
    }

    end {

    }
}