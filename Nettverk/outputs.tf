output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "subnet_1" {
  value = azurerm_subnet.my_terraform_subnet_1.id
}

output "subnet_2" {
  value = azurerm_subnet.my_terraform_subnet_2.id
}