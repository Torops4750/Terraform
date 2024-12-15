variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "rg"
  description = "Name for the resource group"
}

variable "vnet_name" {
  type        = string
  default     = "vnet"
  description = "Name for the Virtual Network"
}

variable "address_space" {
  type        = list(string)
  description = "Network Address"
  default = [ "10.0.0.0/16" ]
}

variable "subnet1" {
  type         = string
  description  = "Name of subnet 1"
}

variable "subnet1_address" {
  type         = string
  description  = "Address of subnet 1"
}

variable "subnet2" {
  type         = string
  description  = "Name of subnet 2"
}

variable "subnet2_address" {
  type         = string
  description  = "Address of subnet 2"
}