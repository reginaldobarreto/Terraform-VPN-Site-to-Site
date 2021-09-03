# Saída de arquivo é onde você define que tipo considerar dando nome para cada função, 
# assim escolhendo o nome de saida do recurso independente do idioma

output "grupo_de_recurso" {
  value = azurerm_resource_group.rg.id  
}

output "rede_virtual" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_dev" {
  value = azurerm_subnet.snet_dev.id
}

output "subnet_prod" {
  value = azurerm_subnet.snet_prod.id
}

output "subnet_gw" {
  value = azurerm_subnet.snetgw.id
}

output "gateway_local" {
  value = azurerm_local_network_gateway.lgw01.id
}

output "ip_public_vpn" {
  value = azurerm_public_ip.pip01.id
}

output "gateway_virtual" {
  value = azurerm_virtual_network_gateway.vgw01.id
}

output "conexao_onpremises" {
  value = azurerm_virtual_network_gateway_connection.cn01.id
}