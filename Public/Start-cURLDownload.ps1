function Start-cURLDownload() {
  <#
    .SYNOPSIS

    .DESCRIPTION
  #>

  param(
    [Parameter(Mandatory)][Alias('URL')][string[]]$URL
  )

  $URL | ForEach-Object {
    $Param = @('--location')      # If the server reports that the requested page has moved to a different location.
    $Param += @('--remote-name')  # Write output to a local file named like the remote file we get.
    $Param += @("${_}")           # Input URL.

    & $(Start-cURL) $Param
  }
}
