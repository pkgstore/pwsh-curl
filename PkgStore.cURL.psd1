@{
  RootModule = 'PkgStore.cURL.psm1'
  ModuleVersion = '0.1.0'
  GUID = '02d8b827-f39b-484c-8e8d-f7d6aa8e8915'
  Author = 'Kitsune Solar'
  CompanyName = 'iHub.TO'
  Copyright = '(c) 2023 Kitsune Solar. All rights reserved.'
  Description = 'PowerShell module for cURL.'
  PowerShellVersion = '7.2'
  RequiredModules = @('PkgStore.Kernel')
  FunctionsToExport = @('Start-cURL')
  PrivateData = @{
    PSData = @{
      Tags = @('pwsh', 'curl')
      LicenseUri = 'https://github.com/pkgstore/pwsh-curl/blob/main/LICENSE'
      ProjectUri = 'https://github.com/pkgstore/pwsh-curl'
    }
  }
}
