output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "app_security_group_id" {
  value = aws_security_group.app.id
}

output "public_subnet_ids" {
  description = "IDs das Subnets públicas"
  value       = aws_subnet.public[*].id
}

output "alb_security_group_id" {
  value = [aws_security_group.alb.id]  # Retorne como uma lista
}
