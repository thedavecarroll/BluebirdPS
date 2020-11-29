@{
    Severity = 'Error','Warning'

    # Use IncludeRules when you want to run only a subset of the default rule set.
    #IncludeRules = @('PSAvoidDefaultValueSwitchParameter',
    #                 'PSMissingModuleManifestField',
    #                 'PSReservedCmdletChar',
    #                 'PSReservedParams',
    #                 'PSShouldProcess',
    #                 'PSUseApprovedVerbs',
    #                 'PSUseDeclaredVarsMoreThanAssigments')

    ExcludeRules = @(
        #'PSAvoidUsingWriteHost',
        'PSMissingModuleManifestField',
        'PSUseDeclaredVarsMoreThanAssignments',
        'PSAvoidUsingConvertToSecureStringWithPlainText', # Export-TwitterAuthentication
        'PSReviewUnusedParameter', # Many switch params used to establish ParamaterSet
        'PSUseLiteralInitializerForHashtable' # New-TwitterQuery, Publish-Tweet
    )

    Rules = @{
        PSAvoidUsingCmdletAliases = @{
            Whitelist = @('task')
        }

    #    Check if your script uses cmdlets that are compatible on PowerShell Core,
    #    version 6.0.0-alpha, on Linux.
    #    PSUseCompatibleCmdlets = @{Compatibility = @("core-6.0.0-alpha-linux")}
    }
}