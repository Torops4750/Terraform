variable "resource_group_location" {
    type = string
    default = "northeurope"
    description = "Location of the resource group."
}

variable "resource_group_name" {
    type = string
    default = "test-group"
    description = "Name of the resource group."
}

variable "name" {
  type        = string
  description = "Name of the LB"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for Loadbalancer"
}