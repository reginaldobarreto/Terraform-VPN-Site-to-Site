# Afim de efetuar uma separação por função de cada arquivo, criamos esse resource.tf
# onde ficara somente os codigos referentes a criação de recursos.

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.loc_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.loc_name
  address_space       = [element(var.vnet_address_space, 0)]
}

resource "azurerm_virtual_network" "vnet01" {
  name                = var.vnet01_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.loc_name
  address_space       = [var.vnet01_address_space]
}

resource "azurerm_subnet" "snet_dev" {
  name                 = var.snet01_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.snet01_address_space]
}

resource "azurerm_subnet" "snet_prod" {
  name                 = var.snet02_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.snet02_address_space]
}

resource "azurerm_subnet" "snet_bas" {
  name                 = var.snet_bas_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.snet_bas_address_space]
}

resource "azurerm_subnet" "snet_vnet01" {
  name                 = var.snet01_vnet01_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.snet01_vnet01_address_space]
}

resource "azurerm_subnet" "snet_gw" {
  name                 = var.snetgw_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.snetgw_address_space]
}

resource "azurerm_local_network_gateway" "lgw01" {
  name                = var.lgw01_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.loc_name
  gateway_address     = var.lgw_gw_address
  address_space       = [var.lgw_snet01_address_space]
}

resource "azurerm_public_ip" "pip01" {
  name                = var.pip01_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.loc_name
  allocation_method   = "Dynamic"

  tags = var.tag_dev
}

resource "azurerm_public_ip" "pip_bas" {
  name                = var.pip_bas_name
  location            = var.loc_name
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tag_dev
}

resource "azurerm_virtual_network_gateway" "vgw01" {
  name                = var.vgw01_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.loc_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.pip01.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.snet_gw.id
  }

}

resource "azurerm_bastion_host" "bas_host" {
  name                = var.bas_host_name
  location            = var.loc_name
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.snet_bas.id
    public_ip_address_id = azurerm_public_ip.pip_bas.id
  }
}

resource "azurerm_virtual_network_gateway_connection" "cn01" {
  name                = var.cn_lgw_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.loc_name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vgw01.id
  local_network_gateway_id   = azurerm_local_network_gateway.lgw01.id

  shared_key = "sh4r3dk3y"
}