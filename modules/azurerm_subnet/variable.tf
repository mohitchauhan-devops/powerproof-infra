variable "subnet_name" {
  type = string
}

variable "subnet_resource_group_name" {
  type = string
}

variable "subnet_vnet_name" {
  type = string
}

variable "subnet_address_prefixes" {
  type = list(string)
}
