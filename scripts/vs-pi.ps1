Write-Host "Installing Visual Studio"
$isoPath = "C:\windows\temp\other\visual_studio_2013_community_update_4.iso"
$rc = Mount-DiskImage -PassThru -ImagePath $isoPath
$driveLetter = ($rc | Get-Volume).DriveLetter
$installPath = Join-Path "${driveLetter}:" "vs_community.exe"
Start-Process -FilePath $installPath -ArgumentList "/adminfile A:\AdminDeployment.xml /quiet /norestart" -NoNewWindow -Wait
Dismount-DiskImage -ImagePath $isoPath
Remove-Item -Force -Path $isoPath 
