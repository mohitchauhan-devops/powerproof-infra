resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method

} 

# # resource "azurerm_public_ip" "pip" {
# #   name                = "pip-digitalcommons"
# #   resource_group_name = "rgelsevier"
# #   location            = "west us 2"
# #   allocation_method   = "Static"

# # }