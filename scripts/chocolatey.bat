:: Install from web
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/installabsolutelatest.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
