variable "cidr_block" {
  type        = string
  description = "O bloco CIDR para a VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs para sub-redes públicas"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs para sub-redes privadas"
}

variable "availability_zones" {
  type        = list(string)
  description = "Lista de zonas de disponibilidade para as sub-redes"
}

variable "environment" {
  type        = string
  description = "Nome do ambiente (development, production)"
}
