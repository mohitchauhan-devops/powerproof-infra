resource "azurerm_resource_group" "rg123" {
  name     = var.resource_group_name
  location = var.resource_group_location
}