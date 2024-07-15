// VM config
vm_name                 = "W2K22"
vm_version              = "v1.0"
operating_system_vm     = "windows2019srvnext-64"
vm_cdrom_type           = "ide"
vm_cpus                 = "1"
vm_cores                = "2"
vm_memory               = "2048"
vm_disk_controller_type = "nvme"
vm_disk_size            = "32768"
vm_network_adapter_type = "e1000e"
vm_dir                  = "C:\\Users\\markw\\AppData\\Local\\Temp\\Packer"
vm_network              = "VMnet8"
vm_hardwareversion      = "20"

// ISO
image_index = {
  "core"                = 1
  "desktop"             = 2
}
win_iso                 = "C:\\Users\\markw\\Documents\\Virtual Machines\\_ISO\\SERVER_EVAL_x64FRE_en-us.iso" # https://go.microsoft.com/fwlink/p/?LinkID=2195280&clcid=0x409&culture=en-us&country=US
win_iso_checksum        = "3E4FA6D8507B554856FC9CA6079CC402DF11A8B79344871669F0251535255325" # PS > Get-FileHash <iso>

// WinRM
winrm_username          = "Administrator"
winrm_password          = "P@cker"