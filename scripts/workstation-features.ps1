Write-Host "Disabling Ctrl+Alt+Del for login..."
New-ItemProperty -Force -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DisableCAD -Type DWord -Value 1

Write-Host "Disabling Shutdown Event Tracker..."
New-Item -Force -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Reliability"
New-ItemProperty -Force -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Reliability" -Name ShutdownReasonOn -Type DWord -Value 0
    

Write-Host "Installing Desktop Experience Feature..."
Install-WindowsFeature Desktop-Experience

Write-Host "Disabling IE Enhanced Security Configuration..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0

Write-Host "Disabling Boot To Start Screen..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Server" -Name ClientExperienceEnabled -Type DWord -Value 0
