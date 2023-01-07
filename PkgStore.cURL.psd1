@{
  RootModule = 'PkgStore.cURL.psm1'
  ModuleVersion = '1.0.0'
  GUID = '02d8b827-f39b-484c-8e8d-f7d6aa8e8915'
  Author = 'Kitsune Solar'
  CompanyName = 'v77 Development'
  Copyright = '(c) 2023 v77 Development. All rights reserved.'
  Description = 'PowerShell module for cURL.'
  PowerShellVersion = '7.1'
  RequiredModules = @('PkgStore.Kernel')
  FunctionsToExport = @('Get-WebResource')
  PrivateData = @{
    PSData = @{
      Tags = @('pwsh', 'curl')
      LicenseUri = 'https://github.com/pkgstore/pwsh-curl/blob/main/LICENSE'
      ProjectUri = 'https://github.com/pkgstore/pwsh-curl'
    }
  }
}
