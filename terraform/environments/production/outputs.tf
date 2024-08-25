output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas criadas"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas criadas"
  value       = module.vpc.private_subnet_ids
}

output "ecs_cluster_id" {
  description = "ID do ECS Cluster"
  value       = module.ecs.ecs_cluster_id
}

output "alb_dns_name" {
  description = "Nome DNS do Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = module.rds.rds_endpoint
}

output "rds_instance_id" {
  value = module.rds.rds_instance_id
}

output "bastion_public_ip" {
  description = "Endereço IP público da instância Bastion"
  value       = module.bastion.bastion_ip
}

output "ecs_profile" {
  value       = { for k, v in module.ecs-instance-profile : k => v }
  description = "Profile ARN, profile ID and role ID"
}