# Bastion Host Security Group Id
output "bastion_sg_id" {
  description = "Value for Id of Bstion host"
  value       = aws_security_group.bastion_sg.id
}

# Public subnet alb security group id 
output "public_subnet_lb_sg_id" {
  description = "Id of public subnet alb"
  value       = aws_security_group.public_subnet_lb_sg.id
}

# Private subnet alb security group id
output "private_subnet_lb_sg_id" {
  description = "id of private subneta alb"
  value       = aws_security_group.private_subnet_lb_sg.id
}

# public subnet security group for lt
output "public_subnet_lt_sg_id" {
  description = "security group for public subnet instance"
  value       = aws_security_group.public_subnet_lt_sg.id
}

# private subnet security group for lt
output "private_subnet_lt_sg_id" {
  description = "security group for private subnet instance"
  value       = aws_security_group.private_subnet_lt_sg.id
}

# database subnet group security group 
output "database_sg" {
  description = "security group for database subnet"
  value       = aws_security_group.database_sg.id
}