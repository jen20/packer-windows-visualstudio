all: isos
	packer build windows_2012_r2.json

vmware: isos
	packer build --only=vmware-iso windows_2012_r2.json

virtualbox: isos
	packer build --only=virtualbox-iso windows_2012_r2.json

isos:
	@mkdir -p iso/other
	@mkdir -p iso/windows
	@[ -f iso/windows/windows2012trial.iso ] || curl -L -o "iso/windows/windows2012trial.iso" -C - http://download.microsoft.com/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.16384.WINBLUE_RTM.130821-1623_X64FRE_SERVER_EVAL_EN-US-IRM_SSS_X64FREE_EN-US_DV5.ISO
	@[ -f iso/other/visual_studio_2013_community_update_4.iso ] || curl -L -o "iso/other/visual_studio_2013_community_update_4.iso" -C - http://go.microsoft.com/?linkid=9863609
	@[ -f iso/other/ReSharper.exe ] || curl -L -o "iso/other/ReSharper.exe" -C - https://download.jetbrains.com/resharper/ReSharperAndToolsPacked01Update1.exe
