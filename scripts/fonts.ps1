$shell = New-Object -com "Shell.Application"
$zip = $shell.NameSpace("C:\windows\temp\other\SourceCodePro_FontsOnly-1.017.zip")
$destination = "C:\windows\temp\other\"
foreach($item in $zip.items())
{
    $shell.Namespace($destination).CopyHere($item)
}

$fontPath = Join-Path (Join-Path $destination "SourceCodePro_FontsOnly-1.017") "TTF"
$dir = $shell.NameSpace($fontPath)
Get-ChildItem -Path $fontPath -filter "*.ttf" | ForEach {
    $dir.ParseName($_.Name).InvokeVerb("Install")
}

Remove-Item -Force "C:\windows\temp\other\SourceCodePro_FontsOnly-1.017.zip"
Remove-Item -Recurse -Force "C:\windows\temp\other\SourceCodePro_FontsOnly-1.017"
