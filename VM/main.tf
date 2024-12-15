# Resource Group
#resource "azurerm_resource_group" "rg" {
#  location = var.resource_group_location
#  name     = var.resource_group_name
#}

data "azurerm_resources" "rg" {
  resource_group_name = var.resource_group_name
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

# Public IP
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  count                = var.nic_count
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Create Virtual Machine
resource "azurerm_linux_virtual_machine" "my_vm" {
  count = var.vm_count
  name = "${var.virtual_machine_name}-${count.index}"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  size = var.virtual_machine_size

  os_disk {
    name = "${var.disk_name}-${count.index}"
    caching = "ReadWrite"
    storage_account_type = var.redundancy_type
  }

 source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  admin_username = var.username
  admin_password = var.password
  disable_password_authentication = false

}