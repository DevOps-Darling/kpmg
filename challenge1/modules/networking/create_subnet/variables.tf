variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "subnet_address_space" {
  description = "Address space for the subnet"
  type        = list(string)
}
