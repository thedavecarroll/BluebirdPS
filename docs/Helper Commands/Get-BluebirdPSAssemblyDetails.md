---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Get-BluebirdPSAssemblyDetails/
schema: 2.0.0
---

# Get-BluebirdPSAssemblyDetails

## SYNOPSIS

Provides information on the enums and classes contained in the BluebirdPS.dll.

## SYNTAX

```powershell
Get-BluebirdPSAssemblyDetails
```

## DESCRIPTION

Provides information on the enums and classes contained in the BluebirdPS.dll.

## EXAMPLES

### Example 1

```powershell
PS > Get-BluebirdPSAssemblyDetails | Format-Table -Property Namespace,Name,BaseType,IsEnum
```

```text
Namespace                          Name                                  MemberType IsEnum
---------                          ----                                  ---------- ------
BluebirdPS                         AccessLevel                             TypeInfo   True
BluebirdPS                         Authentication                          TypeInfo  False
BluebirdPS                         Configuration                           TypeInfo  False
BluebirdPS                         EndpointInfo                            TypeInfo  False
BluebirdPS                         ExpansionTypes                          TypeInfo   True
BluebirdPS                         Helpers                                 TypeInfo  False
BluebirdPS                         HttpMethod                              TypeInfo   True
BluebirdPS                         OAuthParameter                          TypeInfo  False
BluebirdPS                         OAuthVersion                            TypeInfo   True
BluebirdPS                         OutputType                              TypeInfo   True
BluebirdPS                         RateLimitAction                         TypeInfo   True
BluebirdPS                         ResponseData                            TypeInfo  False
BluebirdPS                         ResponseInfo                            TypeInfo  False
BluebirdPS                         TwitterAuthentication                   TypeInfo  False
BluebirdPS                         TwitterObject                           TypeInfo  False
BluebirdPS                         TwitterRequest                          TypeInfo  False
BluebirdPS.APIV1                   AccountSettings                         TypeInfo  False
BluebirdPS.APIV2                   ExpansionFields                         TypeInfo  False
BluebirdPS.APIV2                   ObjectFields                            TypeInfo  False
BluebirdPS.APIV2.ListInfo          List                                    TypeInfo  False
BluebirdPS.APIV2.TweetInfo         Tweet                                   TypeInfo  False
BluebirdPS.APIV2.UserInfo          User                                    TypeInfo  False
BluebirdPS.Exceptions              UnspecifiedException                    TypeInfo  False
BluebirdPS.Validation              ValidateObjectNotNullOrEmptyAttribute   TypeInfo  False
```

Display the requested properties for the assembly.

## PARAMETERS

## INPUTS

### None

## OUTPUTS

### System.Reflection.TypeInfo

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Get-BluebirdPSAssemblyDetails)
