resource "azurerm_subnet" "subnet1235" {
  name                 = var.subnet_name
  resource_group_name  = var.subnet_resource_group_name
  virtual_network_name = var.subnet_vnet_name
  address_prefixes     = var.subnet_address_prefixes  

}