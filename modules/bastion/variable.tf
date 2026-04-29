# AMI Id for bastion host 
variable "ami" {
  description = "ami value for bastion host"
  type        = string
}

# Value for AZS
variable "azs" {
  description = "Value of AZS"
  type        = list(string)
}

# Instance type for Bastion Host
variable "instance_type" {
  description = "instance type for bastion host"
  type        = string
}

# key for the instance 
variable "key" {
  description = "Key for the Instance"
  type        = string
}

# Availability Zone and Subnet ID
variable "az_subnet" {
  description = "Contain the value of the availability zone and subnet id"
  type        = map(string)
}

# Security Groups for Subnet
variable "vpc_security_group_ids" {
  description = "Security Group Id"
  type        = string
}

# Common Tags
variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}

# Value of baston host subnet
variable "enable_single_bastion_host" {
  description = "Single bastion host in Single Az"
  type        = bool
  default     = true
}