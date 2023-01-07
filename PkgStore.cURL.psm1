function Get-WebResource() {
  <#
    .SYNOPSIS
      Downloading web resources with cURL.

    .DESCRIPTION

    .PARAMETER URLs
      Alias: '-U'.

    .EXAMPLE
      Get-WebResource -U 'https://mirror.yandex.ru/debian-cd/current/amd64/iso-cd/SHA256SUMS'

    .LINK
      Package Store: https://github.com/pkgstore

    .NOTES
      Author: Kitsune Solar <mail@kitsune.solar>
  #>

  [CmdletBinding()]

  Param(
    [Parameter(Mandatory)]
    [Alias('U')]
    [string[]]${URLs}
  )

  # cURL executable file.
  ${APP} = "${PSScriptRoot}\App\curl.exe"

  # Checking if a 'curl.exe' exist.
  if ( -not ( Test-Path -Path "${APP}" -PathType "Leaf" ) ) {
    Write-Error -Message "'curl.exe' not found!" -ErrorAction "Stop"
  }

  ForEach ( ${U} in ${URLs} ) {
    # Composing a app command.
    ${CMD} = @( "-L", "-O", "${U}" )

    # Running a app.
    & "${APP}" ${CMD}
  }
}
