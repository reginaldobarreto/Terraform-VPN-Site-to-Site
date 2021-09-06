#Usado para alimentar e sobrepor os valores das variáveis setadas no arquivo variable.tf 
#Util quando os valores das variaveis partir de uma fonte diferente.

rg_name                  = "rg-terraform-lab-001"
loc_name                 = "eastus"
tag_dev                  = { Ambiente = "Dev", Responsavel = "Reginaldo Barreto", Squad = "Devops" }
vnet_name                = "vnet-dev-eastus-001"
snet01_name              = "snet-devs-eastus-001"
snet02_name              = "snet-prod-eastus-001"
snetgw_name              = "GatewaySubnet"
vgw01_name               = "vgw-dev-eastus-001"
lgw01_name               = "lgw-dev-eastus-001"
vnet_address_space       = ["10.0.0.0/20", "192.168.0.0/16", "172.16.0.0/16"]
snet01_address_space     = "10.0.1.0/24"
snet02_address_space     = "10.0.2.0/24"
snet_bas_address_space   = "10.0.14.0/27"
snetgw_address_space     = "10.0.15.0/29"
lgw_snet01_address_space = "172.16.0.0/24"
lgw_gw_address           = "187.38.172.198"
pip01_name               = "pip-vgw-eastus-001"
pip_bas_name             = "pip-bas-eastus-001"
cn_lgw_name              = "cn-onpremise-eastus"
bas_host_name            = "bas_vnet-eastus-001"