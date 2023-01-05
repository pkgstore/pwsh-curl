function Get-WebResource() {
  <#
    .SYNOPSIS
    .DESCRIPTION
  #>

  [CmdletBinding()]

  Param(
    [Parameter(Mandatory)]
    [Alias('URL', 'U')]
    [string[]]${URLs}
  )

  ${cURL} = "${PSScriptRoot}\curl.exe"

  if ( -not ( Test-Path -Path "${cURL}" -PathType "Leaf" ) ) {
    Write-Error -Message "'curl.exe' not found!" -ErrorAction "Stop"
  }

  ForEach ( ${URL} in ${URLs} ) {
    ${CMD} = @( "-L", "-O", "${URL}" )
    & "${cURL}" ${CMD}
  }
}
