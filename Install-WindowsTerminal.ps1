$Package = Get-AppxPackage -Name Microsoft.WindowsTerminal
if ($null -ne $Package) {
    Write-Host "Microsoft.WindowsTerminal is already installed."
    Pause
    exit
}

### Download Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile "$env:temp\Microsoft.VCLibs.x64.14.00.Desktop.appx"

### Download Microsoft.UI.Xaml.2.8.x64.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile "$env:temp\Microsoft.UI.Xaml.2.8.x64.appx"

### Download Windows Terminal
# Windows Terminal Latest 1.21.3231.0
Invoke-WebRequest -Uri https://github.com/microsoft/terminal/releases/download/v1.21.3231.0/Microsoft.WindowsTerminal_1.21.3231.0_8wekyb3d8bbwe.msixbundle -OutFile "$env:temp\Microsoft.WindowsTerminal_1.21.3231.0_8wekyb3d8bbwe.msixbundle"

#Add-AppxPackage .\Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-ProvisionedAppPackage -Online -PackagePath "$env:temp\Microsoft.VCLibs.x64.14.00.Desktop.appx" -SkipLicense
#Add-AppxPackage .\Microsoft.UI.Xaml.2.8.x64.appx
Add-ProvisionedAppPackage -Online -PackagePath "$env:temp\Microsoft.UI.Xaml.2.8.x64.appx" -SkipLicense
#Add-AppxPackage .\Microsoft.WindowsTerminalPreview_1.22.3232.0_8wekyb3d8bbwe.msixbundle
Add-ProvisionedAppPackage -Online -PackagePath "$env:temp\Microsoft.WindowsTerminalPreview_1.22.3232.0_8wekyb3d8bbwe.msixbundle" -SkipLicense

Write-Host "Microsoft.WindowsTerminal installed successfull."
Pause
