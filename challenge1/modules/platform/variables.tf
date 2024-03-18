variable "resource_group_name" {
    type = string
    default = ""
    description = "Declaring resource group"
}

variable "location" {
    type = string
    default = "East US"
    description = "Location of the Azure Virtual Machine"
}

variable "Environment" {
  description = "The environment in which the resources will be deployed (e.g., dev, staging, prod)"
  type        = string
}

variable "Application" {
  description = "The name of the application"
  type        = string
}

variable "CreatedBy" {
  description = "The name of the person or system who created the resources"
  type        = string
}

variable "CreatedDate" {
  description = "The date when the resources were created"
  type        = string
}

variable "CreatedThrough" {
  description = "The tool or method used to create the resources"
  type        = string
}
