#Aqui configuramos todas as nossas preferencias quanto a nome de recursos, bem como localização, etc
#Para usar dentro do arquivo resources.tf chamamos da seguinte forma "var.nome_da_variavel"

variable "resource_group_name" {
  default = "RG-Terraform"
}

variable "location" {
  default = "Brazil South"
}