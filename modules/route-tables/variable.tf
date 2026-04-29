# VPC Id for Route Table
variable "vpc_id" {
  description = "VPC Id for Route Table"
  type        = string
}

# AZS for Local Value
variable "azs" {
  description = "AZS for Local Values"
  type        = list(string)
}

# public subnet id for route table association
variable "public_subnet_id" {
  description = "public subnet id for route table association"
  type        = map(string)
}

# private subnet id for route table association
variable "private_subnet_id" {
  description = "private subnet id for route table association"
  type        = map(string)
}

# Enable singel Nat Gateway for the both the Subnet
variable "enable_single_nat_gateway" {
  description = " Single Nat Gateway"
  type        = bool
  default     = true
}

# Internet Gateway Id
variable "internet_gateway_id" {
  description = " Internet gateway id for Route Table"
  type        = string
}

# Nat Gateway Id for Private Route table
variable "Nat_id" {
  description = "Nat Gateway Id for Private Route Table"
  type        = map(string)
}

#  Public Subnet Destinations CIDR Block 
variable "public_route_destination" {
  description = "Destination cidr block"
  type        = string
  default     = "0.0.0.0/0"
}

# Private Subnet Destination CIDR Block
variable "private_route_destination" {
  description = "Destination cidr block"
  type        = string
  default     = "0.0.0.0/0"
}

# Common Tags
variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}