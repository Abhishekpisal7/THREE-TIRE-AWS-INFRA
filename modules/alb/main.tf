# public subnet alb
# Target group 
resource "aws_lb_target_group" "public_subnet_tg" {
  name        = "public-subnet-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  health_check {
    enabled  = true
    path     = "/"
    protocol = "HTTP"
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "public-subnet-tg"
    }
  )
}

# Load Balancer for public subnet
resource "aws_lb" "public_subnet_lb" {
  name               = "public-subnet-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.public_subnet_alb_sg]
  subnets            = values(var.public_subnet_id)

  tags = merge(
    var.common_tags,
    {
      "Name" = "public-subnet-lb"
    }
  )
}

# lister for public subnet lb
resource "aws_lb_listener" "public_subnet_listener" {
  load_balancer_arn = aws_lb.public_subnet_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_subnet_tg.arn
  }
}

# Private subnet alb
# tg for private subnet
resource "aws_lb_target_group" "private_subnet_tg" {
  name        = "private-subnet-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  health_check {
    enabled  = true
    path     = "/"
    protocol = "HTTP"
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "private-subnet-tg"
    }
  )
}

# load balancer for private subnet 
resource "aws_lb" "private_subnet_lb" {
  name               = "private-subnet-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.private_subnet_alb_sg]
  subnets            = values(var.private_subnet_id)

  tags = merge(
    var.common_tags,
    {
      "Name" = "private-subnet-lb"
    }
  )
}

# listener for the private subnet target group
resource "aws_lb_listener" "private_subnet_listener" {
  load_balancer_arn = aws_lb.private_subnet_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_subnet_tg.arn
  }
}