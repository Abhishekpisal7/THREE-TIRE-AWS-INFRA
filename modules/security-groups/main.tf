# Security Group for Bastion host
resource "aws_security_group" "bastion_sg" {
  name        = "Bastion Host"
  description = "securty group for bastion host"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ip_addr]
  }

  egress {
    description = "Allow All Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "Bastion Host Security Group"
    }
  )
}

# Security group for public subnet load balancer
resource "aws_security_group" "public_subnet_lb_sg" {
  name        = "public lb sg"
  description = "Security group for public subnet load balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow http traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "public-subnet-lb"
    }
  )
}

# Security group for private subnet alb
resource "aws_security_group" "private_subnet_lb_sg" {
  name        = "private subnet lb"
  description = "Security group for private subnet lb"
  vpc_id      = var.vpc_id

  ingress {
    description     = "allow traffic from public subnet"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_subnet_lt_sg.id]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "private-subnet-alb"
    }
  )
}

# security group for public lauch tmplate
resource "aws_security_group" "public_subnet_lt_sg" {
  name        = "public subnet lt sg"
  description = "security group for public subnet launch template"
  vpc_id      = var.vpc_id


  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ip_addr]
  }

  ingress {
    description     = "allow http traffic to instance"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_subnet_lb_sg.id]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "public-subnet-lt-sg"
    }
  )
}

# security group for private sunbnet launch template 
resource "aws_security_group" "private_subnet_lt_sg" {
  name        = "private subnet lt sg"
  description = "security group for private subnet lt"
  vpc_id      = var.vpc_id

  ingress {
    description     = "allow ssh to instance"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  ingress {
    description     = "allow http traffic to instance"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.private_subnet_lb_sg.id]
  }

  egress {
    description = "Allow all out bound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "private-subnet-lt-sg"
    }
  )
}

# Security group for rds  
resource "aws_security_group" "database_sg" {
  name        = "database-security-group"
  description = "security group for rds instance"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow incoming traffic database"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.private_subnet_lt_sg.id]
  }

  egress {
    description = "allow outbound traffic from db server"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "database-sg"
    }
  )
}