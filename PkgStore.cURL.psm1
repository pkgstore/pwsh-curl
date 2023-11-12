<#PSScriptInfo
  .VERSION      0.1.0
  .GUID         02d8b827-f39b-484c-8e8d-f7d6aa8e8915
  .AUTHOR       Kitsune Solar
  .AUTHOREMAIL  mail@kitsune.solar
  .COMPANYNAME  iHub.TO
  .COPYRIGHT    2023 Kitsune Solar. All rights reserved.
  .LICENSEURI   https://github.com/pkgstore/pwsh-curl/blob/main/LICENSE
  .PROJECTURI   https://github.com/pkgstore/pwsh-curl
#>

$App = @('curl.exe', 'curl-ca-bundle.crt', 'libcurl-x64.def', 'libcurl-x64.dll')
$AppExe = @{LiteralPath = "${PSScriptRoot}"; Filter = "$($App[0])"; Recurse = $true; File = $true}
$AppExe = ((Get-ChildItem @AppExe) | Select-Object -First 1)
$NL = "$([Environment]::NewLine)"

function Start-cURLDownload() {
  <#
    .SYNOPSIS

    .DESCRIPTION
  #>

  Param(
    [Parameter(Mandatory)][Alias('I')][string[]]$P_In
  )

  Test-App

  $P_In | ForEach-Object {
    # Composing a app command.
    $Param = @( '-L', '-O', "${_}" )

    # Running a app.
    & "${AppExe}" $Param
  }
}

function Test-App {
  <#
    .SYNOPSIS

    .DESCRIPTION
  #>

  # Getting 'curl.exe' directory.
  $Dir = "$($AppExe.DirectoryName)"

  # Checking the location of files.
  $App | ForEach-Object {
    if (-not (Test-Data -T 'F' -P "${Dir}\${_}")) {
      Write-Msg -T 'W' -A 'Stop' -M ("'${_}' not found!${NL}${NL}" +
      "1. Download '${_}' from 'https://curl.se/windows/'.${NL}" +
      "2. Extract all the contents of the archive into a directory '${PSScriptRoot}'.")
    }
  }
}
