resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = var.security_groups
  key_name       = var.key_name

  tags = {
    Name = "${var.environment}-bastion"
  }
}