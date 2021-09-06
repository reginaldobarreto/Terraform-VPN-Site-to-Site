#Aqui configuramos todas as nossas preferencias quanto a nome de recursos, bem como localização, etc
#Para usar dentro do arquivo resources.tf chamamos da seguinte forma "var.nome_da_variavel"

variable "rg_name" {
  default = "RG-Terraform"
}

variable "loc_name" {
  default = "eastus"
}

variable "tag_dev" {

}

variable "vnet_name" {
  default = "vnet"
}

variable "vnet_address_space" {

}

variable "snet01_address_space" {

}

variable "snet02_address_space" {

}

variable "snet_bas_address_space" {

}

variable "snetgw_address_space" {

}

variable "snet01_name" {
  default = "snet1"
}

variable "snet02_name" {
  default = "snet2"
}

variable "snet_bas_name" {
  default = "AzureBastionSubnet"
}

variable "snetgw_name" {
  default = "snetgw"
}

variable "vgw01_name" {
  default = "vg01"
}

variable "lgw01_name" {
  default = "lgw01"
}

variable "lgw_snet01_address_space" {
  default = "172.16.0.0/24"
}

variable "lgw_gw_address" {

}

variable "pip01_name" {
  default = "pip-001"
}

variable "pip_bas_name" {
  default = "pip_bas-001"
}

variable "cn_lgw_name" {
  default = "cn_connection"
}

variable "bas_host_name" {
  default = "bas_host"
}