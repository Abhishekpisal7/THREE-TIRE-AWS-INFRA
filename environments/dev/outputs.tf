# Region for working
output "region" {
  description = "AWS Region"
  value = var.aws_region
}

# ID of vpc 
output "vpc_id" {
  description = " VPC ID "
  value = module.vpc.vpc_id
}

# public subnet id 
output "public_subnet_id" {
  description = "ID of the public subnet"
  value = module.subnet.public_subnet_id
}

# private subnet id 
output "private_subnet_id" {
  description = "ID of private subnet"
  value = module.subnet.private_subnet_id
}

# database subnet id 
output "db_subnet_id" {
  description = "ID of database subnet"
  value = module.subnet.db_subnet_id
}

# internet gatewat id 
output "internet_gateway_id" {
  description = "ID of internet gateway"
  value = module.internet-gateway.internet_gateway_id
}

# Nat gateway id
output "nat_gateway_id" {
  description = "ID of nat gateway"
  value = module.nat-gateway.Nat_id
}

# bastion host id 
output "bastion_host_id" {
  description = "instance id of bastion host"
  value = module.bastion.bastion_host_id
}

# bastion host ip 
output "bastion_host_ip" {
  description = "ip of bastion host ip"
  value = module.bastion.bastion_host_ip
}

# rds endoint for connection
output "database_endpoint" {
  description = "endpoint of database"
  value = module.rds.database_endpoint
}

# public load balancer dns name
output "public_subnet_alb_dns_name" {
  description = "dns name of public subnet"
  value = module.alb.public_subnet_alb_dns_name
}