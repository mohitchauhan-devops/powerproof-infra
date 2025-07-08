resource "azurerm_virtual_network" "Vnet1234" {
  name                = var.azurerm_virtual_network_name
  location            = var.azurerm_virtual_network_location
  resource_group_name = var.Vnet_resource_group_name
  address_space       = var.Vnet_address_space
  
}