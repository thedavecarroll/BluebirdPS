


$PublicFunctions = Get-ChildItem -Path $sut\Public -File -Exclude '*.tests.ps1' -Recurse
$PrivateFunctions = Get-ChildItem -Path $sut\Private -File -Exclude '*.tests.ps1' -Recurse

Describe -Name 'Function Unit Test Coverage' -Tag 'Coverage' {

    Context 'Public' {
        foreach ($Function in $PublicFunctions) {
            $BaseName = $Function.BaseName
            $FunctionTestFile = "$root\Tests\Unit\Public\$BaseName.tests.ps1"

            it "$BaseName has Pester unit test file" {
                Test-Path -Path $FunctionTestFile | should be $true
            }
        }
    }

    Context 'Private' {
        foreach ($Function in $PrivateFunctions) {
            $BaseName = $Function.BaseName
            $FunctionTestFile = "$root\Tests\Unit\Private\$BaseName.tests.ps1"

            it "$BaseName has Pester unit test file" {
                Test-Path -Path $FunctionTestFile | should be $true
            }
        }
    }
}