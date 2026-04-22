# Region For AWS
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

# VPC variable
# CIDR Block for VPC 
variable "vpc_cidr_block" {
  description = "CIDR for VPC"
  type = string
}

# Subnets Variable
# Availability Zones for Subnets
variable "azs" {
  description = "Avalability Zones for Subnets"
  type = list(string)
}

# CIDR for public Subnet
variable "public_subnet_cidr" {
  description = "CIDR for Public Subnet"
  type = list(string)
}

# CIDR for Private Subnet
variable "private_subnet_cidr" {
  description = "CIDR for Public Subnet"
  type = list(string)
}

#CIDR for database subnet
variable "db_subnet_cidr" {
  description = "CIDR for database subnet"
  type = list(string)
}

# Bastion host 
# ami id for bastion host
variable "ami" {
  description = "Ami id for bastion host"
  type = string
}

# key for bastion host
variable "key" {
  description = "key for Bastion host"
  type = string
}

# instance type for bastion host
variable "instance_type" {
  description = "Instance type of Bastion host"
  type = string
}

# auto scaling launch template
# lanunch template image id
variable "image_id" {
  description = "image id for launch template"
  type = string
}

# instance type for launch template 
variable "asg_instance_type" {
  description = "instance type for launch template"
  type = string
}

# key for launch template instance
variable "asg_key" {
  description = "key for launch template instance"
  type = string
}

# for RDS
# Username for rds 
variable "username" {
  description = "username for rds"
  type = string
}

# password for rds
variable "password" {
  description = "password for rds"
  type = string
}

# instance type for rds
variable "instance_class" {
  description = "instance type for rds"
  type = string
}

## security group
# ip addr for the security group
variable "ip_addr" {
  description = "ip for the security group"
  type = string
}