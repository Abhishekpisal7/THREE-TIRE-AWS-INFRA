# Vpc id for various component
variable "vpc_id" {
  description = "VPC Id for Load Balancer"
  type = string
}

# Subnet id for public subnet alb
variable "public_subnet_id" {
  description = " ID for public subnet alb"
  type = map(string)
}

# Subnet id for private subnet alb
variable "private_subnet_id" {
  description = " ID for private subnet alb"
  type = map(string)
}

# Public subnet alb security group
variable "public_subnet_alb_sg" {
  description = "security group for public subnet alb"
  type = string
}

# Private subnet alb securty group
variable "private_subnet_alb_sg" {
  description = "security group for private subnet alb"
  type = string
}

# common tags
variable "common_tags" {
  description = "Value of common tags"
  type = map(string)
}