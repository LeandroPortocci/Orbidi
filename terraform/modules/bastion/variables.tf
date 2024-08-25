variable "ami_id" {
  type        = string
  description = "AMI ID para o bastion host"
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância do bastion host"
}

variable "subnet_id" {
  type        = string
  description = "ID da sub-rede onde o bastion host será lançado"
}

variable "security_groups" {
  type        = list(string)
  description = "Lista de IDs dos grupos de segurança para o bastion host"
}

variable "key_name" {
  type        = string
  description = "Nome da chave SSH para acessar o bastion host"
}

variable "environment" {
  type        = string
  description = "Nome do ambiente (development, production)"
}