# public subnet alb dns name
output "public_subnet_alb_dns_name" {
  description = "Dns name of public subnet alb"
  value = aws_lb.public_subnet_lb.dns_name
}

# private subnet alb dns name 
output "private_subnet_alb_dns_name" {
  description = "Dns name of private subnet alb"
  value = aws_lb.private_subnet_lb.dns_name 
}

# public subnet target group 
output "public_subnet_tg_arn" {
  description = "arn of public subnet tg"
  value = aws_lb_target_group.public_subnet_tg.arn  
}

# private subnet target group arn
output "private_subnet_tg_arn" {
  description = "arn of private subnet tg"
  value = aws_lb_target_group.private_subnet_tg.arn
}