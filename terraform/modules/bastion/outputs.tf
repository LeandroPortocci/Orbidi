output "bastion_ip" {
  description = "Public IP address of the Bastion host"
  value       = aws_instance.bastion.public_ip
}
