<#PSScriptInfo
  .VERSION      0.1.0
  .GUID         02d8b827-f39b-484c-8e8d-f7d6aa8e8915
  .AUTHOR       Kitsune Solar
  .AUTHOREMAIL  mail@kitsune.solar
  .COMPANYNAME  iHub.TO
  .COPYRIGHT    2023 Kitsune Solar. All rights reserved.
  .LICENSEURI   https://github.com/pkgstore/pwsh-curl/blob/main/LICENSE
  .PROJECTURI
#>

$cURL = @('curl.exe', 'curl-ca-bundle.crt', 'libcurl-x64.def', 'libcurl-x64.dll')
$cURLExe = @{LiteralPath = "${PSScriptRoot}"; Filter = "$($cURL[0])"; Recurse = $true; File = $true}
$cURLExe = ((Get-ChildItem @cURLExe) | Select-Object -First 1)
$NL = "$([Environment]::NewLine)"

function Start-cURL() {
  <#
    .SYNOPSIS

    .DESCRIPTION
  #>

  Param(
    [Parameter(Mandatory)][Alias('U')][string[]]$URLs
  )

  Test-cURL

  $URLs | ForEach-Object {
    # Composing a app command.
    $Params = @( '-L', '-O', "${_}" )

    # Running a app.
    & "${cURLExe}" $Params
  }
}

function Test-cURL {
  # Getting 'curl.exe' directory.
  $D_App = "$($cURLExe.DirectoryName)"

  # Checking the location of files.
  $cURL | ForEach-Object {
    if (-not (Test-Data -T 'F' -P "${D_App}\${_}")) {
      Write-Msg -T 'W' -A 'Stop' -M ("'${_}' not found!${NL}${NL}" +
      "1. Download cURL from 'https://curl.se/windows/'.${NL}" +
      "2. Extract all the contents of the archive into a directory '${PSScriptRoot}'.")
    }
  }
}
