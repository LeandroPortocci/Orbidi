variable "ami_id" {
  type        = string
  description = "AMI ID para as instâncias ECS"
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância ECS"
}

variable "subnets" {
  type        = list(string)
  description = "Lista de IDs das sub-redes para o Auto Scaling Group"
}

variable "security_groups" {
  type        = list(string)
  description = "Lista de IDs dos grupos de segurança"
}

variable "instance_profile" {
  type        = string
  description = "Perfil da instância para o ECS"
}

variable "min_size" {
  type        = number
  description = "Tamanho mínimo do grupo de auto scaling"
}

variable "max_size" {
  type        = number
  description = "Tamanho máximo do grupo de auto scaling"
}

variable "desired_capacity" {
  type        = number
  description = "Capacidade desejada do grupo de auto scaling"
}
variable "cluster_name" {
  type        = string
  description = "Nome do cluster ECS"
}

variable "environment" {
  type        = string
  description = "Nome do ambiente (development, production)"
}