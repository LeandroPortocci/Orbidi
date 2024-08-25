variable "db_name" {
  type        = string
  description = "Nome do banco de dados"
}

variable "allocated_storage" {
  type        = number
  description = "Quantidade de armazenamento alocado para a instância RDS"
}

variable "engine" {
  type        = string
  description = "Tipo de banco de dados (e.g., postgres, mysql)"
}

variable "instance_class" {
  type        = string
  description = "Classe da instância RDS"
}

variable "username" {
  type        = string
  description = "Nome de usuário para o banco de dados"
}

variable "password" {
  type        = string
  description = "Senha para o banco de dados"
}

variable "subnets" {
  type        = list(string)
  description = "Lista de IDs das sub-redes onde a instância RDS será lançada"
}

variable "security_groups" {
  type        = list(string)
  description = "Lista de IDs dos grupos de segurança associados à instância RDS"
}

variable "multi_az" {
  type        = bool
  description = "Se a instância deve ser Multi-AZ"
}

variable "delete_final_snapshot" {
  
}