variable "azurerm_virtual_network_name" {
  type = string
}

variable "azurerm_virtual_network_location" {
  type = string
}

variable "Vnet_resource_group_name" {
  type = string
}

variable "Vnet_address_space" {
  type = list(string)
}