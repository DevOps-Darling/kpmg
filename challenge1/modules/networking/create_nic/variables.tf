variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
}

variable "location" {
  description = "Location for the resources"
  type        = string
}

variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "subnet_id" {
  description = "ID of the Subnet to associate with the Network Interface"
  type        = string
}
