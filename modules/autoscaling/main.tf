# Autoscaling group
# launch template for public subnet asg
resource "aws_launch_template" "public_subnet_lt" {
  name_prefix = "public_subnet_lt"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key
  vpc_security_group_ids = [ var.public_subnet_security_group_id ]

  tags = merge(
    var.common_tags,
    {
        "Name" = "public-subnet-lt"
    }
  )
}

# autoscalling group for public subnet 
resource "aws_autoscaling_group" "public_subnet_asg" {
  name = "public-subnet-asg"
  max_size = 3
  min_size = 1
  desired_capacity = 2
  vpc_zone_identifier = values(var.public_subnet_id) 

  launch_template {
    id = aws_launch_template.public_subnet_lt.id
    version = "$Latest"
  }

  target_group_arns = [ var.public_subnet_tg_arn ]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key = "Name"
    value = "public-subnet-asg-instance"
    propagate_at_launch = true
  }
}

# for private subnet instance
# launch template for private subnet instance 
resource "aws_launch_template" "private_subnet_lt" {
  name_prefix = "private_subnet_lt"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key
  vpc_security_group_ids = [ var.private_subnet_security_group_id ]

  tags = merge(
    var.common_tags,
    {
      "Name" = "private-subnet-lt"
    }
  )
}

# autoscalling group for private subnet 
resource "aws_autoscaling_group" "private_subnet_asg" {
  name = "private-subnet-asg"
  max_size = 3
  min_size = 1
  desired_capacity = 2
  vpc_zone_identifier = values(var.private_subnet_id) 

  launch_template {
    id = aws_launch_template.private_subnet_lt.id
    version = "$Latest"
  }

  target_group_arns = [ var.private_subnet_tg_arn ]

  tag {
    key = "Name"
    value = "private-subnet-asg-instance"
    propagate_at_launch = true 
  }

  lifecycle {
    create_before_destroy = true
  }
}