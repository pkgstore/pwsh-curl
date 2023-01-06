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

  ${cURL} = "${PSScriptRoot}\curl.exe"
  ${CA} = "${PSScriptRoot}\curl-ca-bundle.crt"

  if ( -not ( Test-Path -Path "${cURL}" -PathType "Leaf" ) ) {
    Write-Error -Message "'curl.exe' not found!" -ErrorAction "Stop"
  }

  ForEach ( ${U} in ${URLs} ) {
    ${CMD} = @( "--cacert ${CA}", "-L", "-O", "${U}" )
    & "${cURL}" ${CMD}
  }
}
