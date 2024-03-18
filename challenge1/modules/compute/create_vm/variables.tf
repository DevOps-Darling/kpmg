variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the virtual machine will be deployed"
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual machine will be deployed"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
}

variable "network_interface_ids" {
  description = "List of network interface IDs to attach to the virtual machine"
  type        = list(string)
}

variable "vm_image_publisher" {
  description = "The publisher of the VM image"
  type        = string
}

variable "vm_image_offer" {
  description = "The offer of the VM image"
  type        = string
}

variable "vm_image_sku" {
  description = "The SKU of the VM image"
  type        = string
}

variable "vm_image_version" {
  description = "The version of the VM image"
  type        = string
}

variable "vm_os_disk_strorage_type" {
  description = "The storage type for the OS disk (e.g., Standard_LRS, Premium_LRS)"
  type        = string
}

variable "vm_os_disk_caching" {
  description = "The caching type for the OS disk (e.g., None, ReadOnly, ReadWrite)"
  type        = string
}
