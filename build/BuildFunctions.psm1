function Get-GitLog {
    [CmdLetBinding(DefaultParameterSetName='Default')]
    param (

        [Parameter(ParameterSetName='Default',ValueFromPipeline)]
        [Parameter(ParameterSetName='SourceTarget',ValueFromPipeline)]
        [ValidateScript({Resolve-Path -Path $_ | Test-Path})]
        [string]$GitFolder='.',

        [Parameter(ParameterSetName='SourceTarget',Mandatory)]
        [string]$StartCommitId,
        [Parameter(ParameterSetName='SourceTarget')]
        [string]$EndCommitId='HEAD'
    )

    Push-Location
    try {
        $GitPath = (Resolve-Path -Path $GitFolder).Path
        $GitCommand = Get-Command -Name git -ErrorAction Stop
        if ((Get-Location).Path -ne $GitPath) {
            Set-Location -Path $GitFolder
        }
        Write-Verbose -Message "Folder - $GitPath"
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

    if ($StartCommitId) {
        $GitLogCommand = '"{0}" log --oneline --format="%H`t%h`t%ai`t%an`t%ae`t%ci`t%cn`t%ce`t%G?`t%s`t%f" {1}...{2} 2>&1' -f $GitCommand.Source,$StartCommitId,$EndCommitId
    } else {
        $GitLogCommand = '"{0}" log --oneline --format="%H`t%h`t%ai`t%an`t%ae`t%ci`t%cn`t%ce`t%G?`t%s`t%f" 2>&1' -f $GitCommand.Source
    }

    Write-Verbose -Message "Command - $GitLogCommand"
    $GitLog = Invoke-Expression -Command "& $GitLogCommand" -ErrorAction SilentlyContinue

    if ((Get-Location).Path -ne $GitPath) {
        Pop-Location
    }

    $GitLogFormat = 'CommitId',
        'ShortCommitId',
        'AuthorDate',
        'AuthorName',
        'AuthorEmail',
        'CommitterDate',
        'CommitterName',
        'ComitterEmail',
        @{label='CommitterSignature';expression={
            switch ($_.CommitterSignature) {
                'G' { 'Valid'}
                'B' { 'BadSignature'}
                'U' { 'GoodSignatureUnknownValidity'}
                'X' { 'GoodSignatureExpired'}
                'Y' { 'GoodSignatureExpiredKey'}
                'R' { 'GoodSignatureRevokedKey'}
                'E' { 'MissingKey'}
                'N' { 'NoSignature'}
            }
        }},
        'CommitMessage',
        'SafeCommitMessage'

    if ($GitLog[0] -notmatch 'fatal:') {
        $GitLog | ConvertFrom-Csv -Delimiter "`t" -Header 'CommitId','ShortCommitId','AuthorDate','AuthorName','AuthorEmail','CommitterDate','CommitterName','ComitterEmail','CommitterSignature','CommitMessage','SafeCommitMessage' | Select-Object $GitLogFormat
    } else {
        if ($GitLog[0] -like "fatal: ambiguous argument '*...*'*") {
            Write-Warning -Message 'Unknown revision. Please check the values for StartCommitId or EndCommitId; omit the parameters to retrieve the entire log.'
        } else {
            Write-Error -Category InvalidArgument -Message ($GitLog -join "`n")
        }
    }
    Pop-Location
}

function Get-ReleaseNotes {
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateScript({Test-Path -Path $_})]
        [string]$ChangeLogPath,
        [Parameter(Mandatory)]
        [uri]$ChangeLogUri
    )

    $FullChangeLogLocation = "For full CHANGELOG, see $ChangeLogUri" -f $ChangeLogUri.AbsoluteUri

    $ChangeLog = [System.Text.StringBuilder]::new()
    $Lines = Get-Content -Path $ChangeLogPath
    $Count = 0
    foreach ($Line in $Lines) {
        if ($Line -match '^## \[\d\.|^## \d\.') {
            if ($null -eq $LastReleaseBegin) {
                $LastReleaseBegin = $Count
            } elseif ($null -eq $LastReleaseEnd) {
                $LastReleaseEnd = $Count - 1
                break
            }
        }
        $Count++
    }
    [void]$ChangeLog.Append($Lines[$LastReleaseBegin..$LastReleaseEnd] -join [System.Environment]::NewLine)
    [void]$ChangeLog.AppendLine()

    [void]$ChangeLog.AppendLine($FullChangeLogLocation)

    $ChangeLog.ToString()
}

function Get-ChangeLogUpdate {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateScript({Test-Path -Path $_})]
        [string]$ProjectPath,
        [Parameter(Mandatory)]
        [ValidateSet('Bugfix','Security','Feature','Maintenance')]
        [string[]]$ReleaseType,
        [Parameter(Mandatory)]
        [ValidateSet('Not Required','Recommended','Strongly Recommended')]
        [string]$UpdateRequired,
        [Parameter(Mandatory)]
        [string]$ProjectOwner,
        [Parameter(Mandatory)]
        [version]$TargetRelease,
        [uri]$ReleaseLink,
        [string]$TargetReleaseDate='Unreleased'
    )

    try {
        enum ChangeLogEntryType {
            Security; Deprecated; Removed; Fixed; Changed; Added; Maintenance
        }
        $ProjectPath = Resolve-Path -Path $ProjectPath
        $Project = Split-Path -Path $ProjectPath -Leaf
        $LastReleaseCommit = Get-GitHubRelease -OwnerName $ProjectOwner -RepositoryName $Project | Sort-Object -Property created_at -Descending | Select-Object -First 1
        if ($LastReleaseCommit) {
            $GitLog = Get-GitLog -GitFolder $ProjectPath -StartCommitId $LastReleaseCommit.target_commitish
        } else {
            $GitLog = Get-GitLog -GitFolder $ProjectPath
        }

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

    $NewChangeLogEntry = [System.Text.StringBuilder]::new()
    [void]$NewChangeLogEntry.AppendLine()

    if ($ReleaseLink) {
        $TargetReleaseText = '## [{0}] - {1}' -f $TargetRelease.ToString(),$TargetReleaseDate
    } else {
        $TargetReleaseText = '## {0} - {1}' -f $TargetRelease.ToString(),$TargetReleaseDate
    }
    [void]$NewChangeLogEntry.AppendLine($TargetReleaseText)
    [void]$NewChangeLogEntry.AppendLine()

    switch ($ReleaseType.Count) {
        1 { $ReleaseTags = $ReleaseType[0] }
        2 { $ReleaseTags = '{0} and {1}' -f $ReleaseType[0],$ReleaseType[1] }
        3 { $ReleaseTags = '{0}, {1}, and {2}' -f $ReleaseType[0],$ReleaseType[1],$ReleaseType[2] }
        4 { $ReleaseTags = '{0}, {1}, {2}, and {3}' -f $ReleaseType[0],$ReleaseType[1],$ReleaseType[2],$ReleaseType[3] }
    }
    $ReleaseTypeText = '{0}; Update {1}' -f $ReleaseTags,$UpdateRequired
    [void]$NewChangeLogEntry.AppendLine($ReleaseTypeText)
    [void]$NewChangeLogEntry.AppendLine()

    $ChangeLogCommits = foreach ($Commit in $GitLog) {
        $IssueNumber = $GitHubIssue = $null
        $Action,$Message = $Commit.CommitMessage -Split ' '

        if ([ChangeLogEntryType].GetEnumNames() -match "^$Action") {
            $EntryType = [ChangeLogEntryType]$Action
        } else {
            $EntryType = 'Maintenance'
        }
        if ($Message -match '#') {
            $Issue = $Message -match '#'
            if ($Issue -is [boolean]) {
                $IssueNumber = $Message.Replace('#','')
            } else {
                $IssueNumber = $Issue.Replace('#','')
            }

            $GitHubIssue = Get-GitHubIssue -OwnerName $ProjectOwner -RepositoryName $Project -Issue $IssueNumber |
                Select-Object -Property number,html_url,title,labels |
                Sort-Object -Property number

            $IssuesWithChangeLogLabels = $GitHubIssue.labels.Where{$_.Description -match 'CHANGELOG'} | Select-Object -First 1
            if ($IssuesWithChangeLogLabels) {
                $EntryType =  [ChangeLogEntryType]$IssuesWithChangeLogLabels.LabelName
            }
        }

        [PSCustomObject]@{
            ShortCommitId = $Commit.ShortCommitId
            CommitDate = $Commit.CommitDate
            EntryType = $EntryType
            CommitMessage = $Commit.CommitMessage
            GitHubIssue = $GitHubIssue
        }
    }
    #$ChangeLogCommits | Out-String | Write-Verbose

    foreach ($EntryType in [ChangeLogEntryType].GetEnumNames()) {
        #$SectionCommits = $ChangeLogCommits.Where({$_.EntryType -match $EntryType -and $_.GitHubIssue}) | Sort-Object -Property GitHubIssue.created_at,CommitterDate,CommitMessage
        $SectionCommits = $ChangeLogCommits.Where({$_.EntryType -match $EntryType}) | Sort-Object -Property GitHubIssue.created_at,CommitterDate,CommitMessage

        if ($SectionCommits) {
            $SectionHeader = '### {0}' -f $EntryType
            $SectionHeader | Write-Verbose
            [void]$NewChangeLogEntry.AppendLine($SectionHeader)
            [void]$NewChangeLogEntry.AppendLine()

            foreach ($Entry in $SectionCommits) {
                if ($EntryType -eq 'Maintenance') {
                    if ($Entry.GitHubIssue -And $Entry.GitHubIssue.html_url -notmatch 'pull') {
                        $EntryText = '- [Issue #{0}]({1}) - {2}' -f $Entry.GitHubIssue.number,$Entry.GitHubIssue.html_url,$Entry.GitHubIssue.title
                    }
                } else {
                    if ($Entry.GitHubIssue) {
                        $EntryText = '- [Issue #{0}]({1}) - {2}' -f $Entry.GitHubIssue.number,$Entry.GitHubIssue.html_url,$Entry.GitHubIssue.title
                    } else {
                        if ($Entry.CommitMessage -notmatch 'release') {
                            $EntryText = '- No Issue - {0}' -f $Entry.CommitMessage
                        }
                    }
                }
                if (-Not $NewChangeLogEntry.ToString().Contains($EntryText)) {
                    $EntryText | Write-Verbose
                    [void]$NewChangeLogEntry.AppendLine($EntryText)
                }
            }
            [void]$NewChangeLogEntry.AppendLine()
        }
    }

    if ($ReleaseLink) {
        $ReleaseLinkText = '[{0}]: {1}' -f $TargetRelease.ToString(),$ReleaseLink.AbsoluteUri
        [void]$NewChangeLogEntry.AppendLine($ReleaseLinkText)
    }

    $NewChangeLogEntry.ToString()
}

function Get-MilestoneByReleaseVersion {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$OwnerName,
        [Parameter(Mandatory)]
        [string]$RepositoryName,
        [Parameter(Mandatory)]
        [string]$ReleaseVersion
    )
    $Format = 'RepositoryUrl','MilestoneNumber',@{l='ReleaseVersion';e={$_.title}},
        @{l='Description';e={$_.description}},@{l='State';e={$_.state}},
        @{l='Created';e={$_.created_at}},@{l='Closed';e={$_.closed_at}},@{l='Due';e={$_.due_on}},
        @{l='OpenIssues';e={$_.open_issues}},@{l='ClosedIssues';e={$_.closed_issues}}
    try {
        Get-GitHubMilestone -OwnerName $OwnerName -RepositoryName $RepositoryName |
            Select-Object $Format |
            Where-Object ReleaseVersion -match $ReleaseVersion
    }
    catch{
        $PSCmdlet.ThrowTerminatingError($_)
    }
}

function Get-ChangeLogLabels {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$OwnerName,
        [Parameter(Mandatory)]
        [string]$RepositoryName
    )
    $Format = 'LabelName',@{l='EntryType';e={$_.LabelName.Split('.')[-1]}},@{l='Description';e={$_.description}}
    try {
        Get-GitHubLabel -OwnerName $OwnerName -RepositoryName $RepositoryName |
            Where-Object LabelName -match '^CHANGELOG' |
            Sort-Object LabelName |
            Select-Object $Format
    }
    catch{
        $PSCmdlet.ThrowTerminatingError($_)
    }
}

function Join-OxfordComma {
    [Alias('jox')]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [string[]]$JoinList,
        [ValidateSet('and','or')]
        [string]$Type = 'and'
    )
    begin {
        $List = [System.Collections.Generic.List[string]]::new()
    }
    process {
        foreach ($Item in $JoinList) {
            $List.Add($Item)
        }
    }
    end {
        if ($List.count -gt 2) {
            '{0}, {1} {2}' -f ($List[0..($List.count-2)] -join ', '),$Type,$List[-1]
        } else {
            '{0} {1} {2}' -f $List[0],$Type,$List[1]
        }
    }
}

function Get-ChangeLogUpdateForMilestone {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$OwnerName,
        [Parameter(Mandatory)]
        [string]$RepositoryName,
        [Parameter(Mandatory)]
        [string]$TargetRelease,
        [Parameter()]
        [uri]$ReleaseLink
    )

    function GetEntryText {
        param($Issue)
        if ($Issue.State -eq 'open') {
            '- OPEN [Issue #{0}]({1}) - {2}' -f $Issue.IssueNumber,$Issue.Url,$Issue.Title
        } elseif ($Issue.StateReason -ne 'not_planned') {
            '- [Issue #{0}]({1}) - {2}' -f $Issue.IssueNumber,$Issue.Url,$Issue.Title
        } elseif ($Issue.StateReason -eq 'not_planned') {
            'NOT PLANNED - Issue #{0} - {1} ' -f $Issue.IssueNumber,$Issue.Title | Write-Warning
        }
    }

    $LabelFormat = 'LabelName',@{l='EntryType';e={$_.LabelName.Split('.')[-1]}},@{l='Description';e={$_.description}}
    $Format = 'IssueNumber',@{l='Title';e={$_.title}},@{l='Created';e={$_.created_at}},@{l='Closed';e={$_.closed_at}},
        @{l='State';e={$_.state}},@{l='StateReason';e={$_.state_reason}},
        @{l='EntryType';e={($_.labels | Where-Object LabelName -match 'CHANGELOG' | Select-Object $LabelFormat).LabelName}},
        @{l='Url';e={$_.html_url}}
    $GeneralParameters = @{
        OwnerName = $OwnerName
        RepositoryName = $RepositoryName
    }
    $LatestRelease = Get-GitHubRelease @GeneralParameters | Sort-Object Published | Select-Object -First 1
    $MilestoneRelease = Get-MilestoneByReleaseVersion -ReleaseVersion $TargetRelease @GeneralParameters
    $MilestoneIssues = Get-GitHubIssue -MilestoneNumber $MilestoneRelease.MilestoneNumber -State All @GeneralParameters |
        Select-Object $Format |
        Sort-Object EntryType,IssueNumber

    $NewChangeLogEntry = [System.Text.StringBuilder]::new()
    [void]$NewChangeLogEntry.AppendLine()

    #region Target Release
    if ($MilestoneRelease.Due) {
        $TargetReleaseDate = $MilestoneRelease.Due.ToString("yyyy-MM-dd")
    } else {
        $TargetReleaseDate = 'Pending'
    }
    if ($ReleaseLink) {
        $TargetReleaseText = '## [{0}] - {1}' -f $TargetRelease,$TargetReleaseDate
    } else {
        $TargetReleaseText = '## {0} - {1}' -f $TargetRelease,$TargetReleaseDate
    }
    [void]$NewChangeLogEntry.AppendLine($TargetReleaseText)
    [void]$NewChangeLogEntry.AppendLine()
    #endregion

    #region Release Type and Update Type
    $ReleaseType = [System.Collections.Generic.List[string]]::new()
    $UpdateType = $null
    if ($MilestoneIssues.EntryType -match 'Security') {
        $ReleaseType.Add('Security')
        if ($null -eq $UpdateType) { $UpdateType = 'Strongly Recommended' }
    }
    if ($MilestoneIssues.EntryType -match 'Fixed|Deprecated|Removed') {
        $ReleaseType.Add('Bugfix')
        if ($null -eq $UpdateType) { $UpdateType = 'Strongly Recommended' }
    }
    if ($MilestoneIssues.EntryType -match 'Added|Changed') {
        $ReleaseType.Add('Feature')
        if ($null -eq $UpdateType) { $UpdateType = 'Recommended' }
    }
    if ($MilestoneIssues.EntryType -match 'Maintenance') {
        $ReleaseType.Add('Maintenance')
        if ($null -eq $UpdateType) { $UpdateType = 'Not Required' }
    }
    $ReleaseTypeText = '{0}; Update {1}' -f ($ReleaseType | Join-OxfordComma),$UpdateType
    [void]$NewChangeLogEntry.AppendLine($ReleaseTypeText)
    [void]$NewChangeLogEntry.AppendLine()
    #endregion

    $EntryTypeInRelease = $MilestoneIssues.EntryType | Sort-Object -Unique
    foreach ($Entry in ($EntryTypeInRelease)) {
        $EntryType = $Entry.Split('.')[-1]
        $SectionHeader = '### {0}' -f $EntryType
        [void]$NewChangeLogEntry.AppendLine($SectionHeader)
        [void]$NewChangeLogEntry.AppendLine()

        foreach ($Issue in ($MilestoneIssues | Where-Object EntryType -match $EntryType)) {
            $EntryText = GetEntryText -Issue $Issue
            [void]$NewChangeLogEntry.AppendLine($EntryText)
        }
        [void]$NewChangeLogEntry.AppendLine()
    }

    if ($MilestoneIssues | Where-Object EntryType -eq $null) {
        [void]$NewChangeLogEntry.AppendLine('### No ChangeLog Entry Type')

        foreach ($Issue in ($MilestoneIssues | Where-Object EntryType -eq $null)) {
            $EntryText = GetEntryText -Issue $Issue
            [void]$NewChangeLogEntry.AppendLine($EntryText)
        }
        [void]$NewChangeLogEntry.AppendLine()
    }

    if ($ReleaseLink) {
        $ReleaseLinkText = '[{0}]: {1}' -f $TargetRelease.ToString(),$ReleaseLink.AbsoluteUri
        [void]$NewChangeLogEntry.AppendLine($ReleaseLinkText)
    }

    $NewChangeLogEntry.ToString()

}

function Set-ChangeLog {
    [CmdletBinding()]
    param(
        [ValidateScript({Test-Path $_})]
        [string]$ChangeLogPath,
        [Parameter(Mandatory)]
        [string]$ChangeLogUpdate
    )

    $ChangeLog = [System.Text.StringBuilder]::new()
    $Lines = Get-Content -Path $ChangeLogPath
    $Count = 0
    foreach ($Line in $Lines) {
        if ($Line -match '^## \[\d\.|^## \d\.') {
            if ($null -eq $LastReleaseBegin) {
                $LastReleaseBegin = $Count
            } elseif ($null -eq $LastReleaseEnd) {
                $LastReleaseEnd = $Count - 1
                break
            }
        }
        $Count++
    }

    if ($Lines[$LastReleaseBegin] -ne $ChangeLogUpdate.Split([System.Environment]::NewLine)[2]) {

        # use original heading
        [void]$ChangeLog.Append($Lines[0..($LastReleaseBegin-1)] -join [System.Environment]::NewLine)

        # add updated entry
        [void]$ChangeLog.Append($ChangeLogUpdate)

        # use original remainer
        [void]$ChangeLog.Append($Lines[($LastReleaseBegin)..($Lines.Count)] -join [System.Environment]::NewLine)

        Set-Content -Path $ChangeLogPath -Value $ChangeLog.ToString() -Force

    } else {
        ' No changes made to {0}' -f $ChangeLogPath | Write-Warning
    }
}