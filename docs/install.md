# How to Install

## From the PowerShell Gallery

Start PowerShell 7 and run the following command:

```powershell
Install-Module -Name BluebirdPS -Scope CurrentUser
```

For more information, please visit the [BluebirdPS page] on the Powershell Gallery.

[BluebirdPS page]: https://bit.ly/BluebirdPS

## From the GitHub Release Page

1. Click [here] to go to the latest releases, then download the BluebirdPS.zip file attached to the release.
2. Right-click the downloaded zip, select Properties, then unblock the file.
  *This is to prevent having to unblock each file individually after unzipping.*
3. Unzip the archive.
4. *(Optional)* Place the module somewhere in your PSModulePath.
    * You can view the paths listed by running the environment variable `$env:PSModulePath`

[here]: https://github.com/thedavecarroll/BluebirdPS/tags

## Building from the GitHub Repo

1. Clone repo to a folder of your choice.
2. Change into the local repo folder.
3. Run the `build.ps1` script.
4. `Import-Module -Path .\BuildOutput\BluebirdPS\<module version>\BluebirdPS.psd1`
