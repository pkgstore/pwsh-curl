function Start-cURLDownload() {
  <#
    .SYNOPSIS
    Downloading data.

    .DESCRIPTION
    Downloading data using cURL.

    .PARAMETER URL
    URL to the data to be downloaded.

    .EXAMPLE
    Start-cURLDownload -URL 'https://mirror.yandex.ru/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso'
  #>

  param(
    [Parameter(Mandatory)][Alias('U')][string[]]$URL
  )

  $URL | ForEach-Object {
    $Param = @('--location')        # If the server reports that the requested page has moved to a different location.
    $Param += @('--remote-name')    # Write output to a local file named like the remote file we get.
    $Param += @("${_}")             # Input URL.

    & $(Start-cURL) $Param
  }
}
