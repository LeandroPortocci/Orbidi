resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
}

resource "aws_launch_configuration" "ecs" {
  name = "${var.environment}-launch-configuration"
  image_id = var.ami_id
  instance_type = var.instance_type
  security_groups = var.security_groups
  iam_instance_profile = var.instance_profile
}

resource "aws_autoscaling_group" "ecs" {
  launch_configuration = aws_launch_configuration.ecs.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnets
  tag {
    key                 = "Name"
    value               = "${var.environment}-auto-scaling-group"
    propagate_at_launch = true
  }
}

resource "aws_iam_role" "ecs_instance_role" {
  name = "ecs_instance_profile-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs_instance_profile-${var.environment}"
  role = aws_iam_role.ecs_instance_role.name
}
