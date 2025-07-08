# ye data block k code k sath hai

module "resource_group" {
  source = "../modules/azurerm_resource_group"
resource_group_name = "rgelsevier"
resource_group_location = "west us 2"

}

module "virtual_network" {
    depends_on = [module.resource_group]
  source = "../modules/azurerm_virtual_network"
  azurerm_virtual_network_name = "aptarakaVnet"
  azurerm_virtual_network_location = "west us 2"
  Vnet_resource_group_name = "rgelsevier"
  Vnet_address_space = ["196.148.0.0/27"]
}

module "frontend1_subnet" {
    depends_on = [module.virtual_network]
    source = "../modules/azurerm_subnet"
    subnet_name = "frontend-subnet"
    subnet_resource_group_name = "rgelsevier"
    subnet_vnet_name = "aptarakaVnet"
    subnet_address_prefixes = ["196.148.0.0/29"]
  
}

module "backend2_subnet" {
    depends_on = [module.virtual_network]
    source = "../modules/azurerm_subnet"
    subnet_name = "backend-subnet"
    subnet_resource_group_name = "rgelsevier"
    subnet_vnet_name = "aptarakaVnet"
    subnet_address_prefixes = ["196.148.0.8/29"]
  
}

module "fe_public-ip" {
  depends_on = [module.resource_group]
  source = "../modules/azurerm_public_ip"
  public_ip_name = "pip-digitalcommons_fe"
  resource_group_name = "rgelsevier"
  location = "west us 2"
  allocation_method = "Static"
}

# module "be_public-ip" {
#   depends_on = [module.resource_group]
#   source = "../modules/azurerm_public_ip"
#   public_ip_name = "pip-digitalcommons_be"
#   resource_group_name = "rgelsevier"
#   location = "west us 2"
#   allocation_method = "Static"
# }

module "frontend_vm" {
  depends_on = [module.frontend1_subnet]
  source = "../modules/azurerm_virtual_machine"

  nic_name = "nic-vm-frontend"
  location = "west us 2"
  resource_group_name = "rgelsevier"
  vm_name = "myfrontend-vm"
  vm_size = "Standard_F2"
  admin_username = "aptaraadmin"
  admin_password = "Aptara@12345"
  image_publisher = "canonical"
  image_offer = "0001-com-ubuntu-server-focal"
  image_sku = "20_04-lts"
  image_version = "latest"
  subnet_name = "frontend-subnet"
  virtual_network_name = "aptarakaVnet"
  public_ip_name = "pip-digitalcommons_fe"
  }

# module "backend_vm" {
#   depends_on = [module.backend2_subnet]
#   source = "../modules/azurerm_virtual_machine"

#   nic_name = "nic-vm-backend"
#   location = "west us 2"
#   resource_group_name = "rgelsevier"
#   vm_name = "mybackend-vm"
#   vm_size = "Standard_F2"
#   admin_username = "aptaraadmin1"
#   admin_password = "Aptara@12345"
#   image_publisher = "canonical"
#   image_offer = "0001-com-ubuntu-server-focal"
#   image_sku = "20_04-lts"
#   image_version = "latest"
#  subnet_name = "backend-subnet"
#  virtual_network_name = "aptarakaVnet"
#  }

module "sql_server" {
  source = "../modules/azurerm_sql_server"

  sql_server_name = "powermanage-sql"
  resource_group_name = "rgelsevier"
  location = "west us 2"
  administrator_login = "Sqlserver"
  administrator_login_password = "Sql@123456"
  
}

module "sql_database" {
  depends_on = [module.sql_server]
  source = "../modules/azurerm_sql_database"
  sql_database_name = "aptaradb"
  server_id = "/subscriptions/3f7c4872-f198-45b7-984d-0ab188b016e6/resourceGroups/rgelsevier/providers/Microsoft.Sql/servers/powermanage-sql"
}
 
 


  
