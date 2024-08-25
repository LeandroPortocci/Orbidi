resource "aws_db_subnet_group" "rds" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnets
}

resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  storage_type         = "gp2"
  engine               = var.engine
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.rds.name
  vpc_security_group_ids = var.security_groups
  multi_az             = var.multi_az
  final_snapshot_identifier = "${var.db_name}-final-snapshot"
  skip_final_snapshot  = !var.delete_final_snapshot
}