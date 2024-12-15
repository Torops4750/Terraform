variable "resource_group_location" {
  type = string
  default = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type = string
  default = "test-group"
  description = "Name of the resource group."
}

variable "vnet_name" {
  description = "Name for the Virtual Network"
  type        = string
  default     = "myVNet"
}

variable "address_space" {
  type        = list(string)
  description = "Network Address"
  default = [ "10.0.0.0/16" ]
}

variable "subnet_name" {
  description = "Navn på subnett"
  type        = string
  default     = "mySubnet"
}

variable "subnet_address_prefix" {
  description = "Adresseområde for subnett"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_ip_name" {
  description = "Navn på public IP"
  type        = string
  default     = "myPublicIP"
}

variable "nic_name" {
  description = "Navn på network interface"
  type        = string
  default     = "myNIC"
}

variable "nic_count" {
  description = "Antall NIC"
  type = number
  default = 1  
}

variable "virtual_machine_name" {
  description = "namn på virtuell maskin"
  type        = string
  default     = "virtual_machine_name"
}
variable "vm_count" {
  description = "Kor mange VM-ar"
  type = number
  default = 1
}

variable "virtual_machine_size" {
  type = string
  default = "Standard_B2s"
  description = "Size or SKU of the Virtual Machine."
}

variable "disk_name" {
    description = "Namn på disken"
    type = string
    default = "Disk"
  }

variable "redundancy_type" {
  type = string
  default = "Standard_LRS"
  description = "Storage redundancy type of the OS disk."
}

variable "image_publisher" {
  description = "Image publisher for VM"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Image offer for VM"
  type        = string
  default     = "ubuntu-24_04-lts"
}

variable "image_sku" {
  description = "Image SKU for VM"
  type        = string
  default     = "server"
}

variable "image_version" {
  description = "Image version for VM"
  type        = string
  default     = "latest"
}

variable "username" {
  type = string
  default = "microsoft"
  description = "The username for the local account that will be created on the new VM."
}

variable "password" {
  type = string
  default = "Microsoft@123"
  description = "The passoword for the local account that will be created on the new VM."
}

