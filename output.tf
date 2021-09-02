# Saída de arquivo é onde você define que tipo considerar dando nome para cada função, 
# assim escolhendo o nome de saida do recurso independente do idioma

output "grupo_de_recurso" {
  value = azurerm_resource_group.rg.id  
}