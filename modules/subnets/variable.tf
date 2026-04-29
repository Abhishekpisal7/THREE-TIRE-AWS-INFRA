# Subnet VPC Id
variable "vpc_id" {
  description = "vpc_id for subnet"
  type        = string
}

# Avilability Zones for Subnet
variable "azs" {
  description = "Availability Zone for Subnets"
  type        = list(string)
}

# cIDR for Public Subnet
variable "public_subnet_cidr" {
  description = "CIDR for Public Subnet"
  type        = list(string)
}

# CIDR for Private Subnet
variable "private_subnet_cidr" {
  description = "CIDR for Private Subnet"
  type        = list(string)
}

# CIDR for database subnet
variable "db_subnet_cidr" {
  description = "CIDR for database subnet"
  type        = list(string)
}

# Comman Tags
variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}