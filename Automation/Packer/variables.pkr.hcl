variable "vm_name" {
  type        = string
  description = "Name VM"
}

variable "vm_version" {
  type        = string
  description = "Version number"
}

variable "vm_dir" {
  type        = string
  description = "Dir to store VM in"
}

variable "operating_system_vm" {
  type        = string
  description = "Guest OS"
}

variable "template" {
  type = string 
  default = "desktop" 
  description = "Template type, can be desktop or core"
  validation {
    condition = (var.template == "desktop") || (var.template == "core")
    error_message = "Should be desktop or core."
  }
}

variable "image_index" {
  type = map(string)
}

variable "vm_cores" {
  type        = string
  description = "Amount of cores"
}

variable "vm_cpus" {
  type        = string
  description = "Amount of vCPUs"
}

variable "vm_disk_controller_type" {
  type        = string
  description = "Controller type"
}

variable "vm_disk_size" {
  type        = string
  description = "Harddisk size"
}

variable "vm_hardwareversion" {
  type        = string
  description = "VM hardware version"
}

variable "vm_cdrom_type" {
  type        = string
  description = "The virtual machine CD-ROM type. (e.g. 'sata', or 'ide')"
}

variable "cdrom_drive" {
  type = string
  description = "CD-ROM Driveletter for extra iso"
  default = "E:"
}

variable "vm_memory" {
  type        = string
  description = "VM Memory"
}

variable "vm_network_adapter_type" {
  type        = string
  description = "Networkadapter type"
}

variable "vm_network" {
  type        = string
  description = "Network"
}

variable "win_iso" {
  type        = string
  description = "Windows ISO location"
}

variable "win_iso_checksum" {
  type        = string
  description = "Windows ISO checksum"
}

variable "winrm_username" {
  type        = string
  description = "WinRM username"
}

variable "winrm_password" {
  type        = string
  description = "WinRM password"
}