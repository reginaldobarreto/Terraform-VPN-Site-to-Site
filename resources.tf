# Afim de efetuar uma separação por função de cada arquivo, criamos esse resource.tf
# onde ficara somente os codigos referentes a criação de recursos.

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}