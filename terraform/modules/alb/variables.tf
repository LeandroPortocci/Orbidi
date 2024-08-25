variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "security_groups" {
  description = "List of security groups for the ALB"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listener"
  type        = string
}

variable "target_group_port" {
  description = "Port for the ALB target group"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Path for health checks"
  type        = string
  default     = "/"
}

variable "environment" {
  type        = string
  description = "Nome do ambiente (development, production)"
}

variable "subnet_ids" {
  type        = list(string)  
  
}
variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}
