packer {
  required_version = ">= 1.9.4"
  
  required_plugins {
    vmware = {
      version = ">= 1.0.7"
      source  = "github.com/hashicorp/vmware"
    }
  }

  required_plugins {
    windows-update = {
      version = ">= 0.14.3"
      source  = "github.com/rgl/windows-update"
    }
  }
}

source "vmware-iso" "server" {
  // VM
  vm_name           = "${title(var.vm_name)}_${title(var.template)}_${var.vm_version}"
  output_directory  = var.vm_dir

  // Hardware specs
  cpus                 = var.vm_cpus
  cores                = var.vm_cores
  memory               = var.vm_memory
  disk_size            = var.vm_disk_size
  disk_adapter_type    = var.vm_disk_controller_type
  network_adapter_type = var.vm_network_adapter_type
  network              = var.vm_network
  cdrom_adapter_type   = var.vm_cdrom_type
  
  // Guest OS
  guest_os_type = var.operating_system_vm
  version       = var.vm_hardwareversion
  iso_checksum  = var.win_iso_checksum
  iso_url       = var.win_iso
  cd_files = ["Resources/*"]
  cd_content = {
    "autounattend.xml" = templatefile("Resources/Configs/unattend.pkrtpl", {
      password = var.winrm_password, 
      cdrom_drive = var.cdrom_drive, 
      index = lookup(var.image_index, var.template, "core")
    })
  }
  cd_label = "unattend"
  
  // WinRM 
  insecure_connection = "true"
  communicator        = "winrm"
  winrm_port          = "5985"
  winrm_username      = var.winrm_username
  winrm_password      = var.winrm_password
  winrm_timeout       = "12h"
  shutdown_command    = "shutdown /s /t 10 /f"
}

build {
  sources = ["source.vmware-iso.server"]

  provisioner "powershell" {
    scripts = ["Resources/Scripts/VMware_Tools.ps1"]
  }
  
  provisioner "powershell" {
    scripts = ["Resources/Scripts/Updates.ps1"]
  }
}