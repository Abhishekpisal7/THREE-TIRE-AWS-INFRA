# CIDR for VPC
variable "vpc_cidr_block" {
  description = "CIDR block value for vpc"
  type        = string
}

# Setting Instance Tenancy for Resorces in VPC
variable "instance_tenancy" {
  description = "VPC instance tenancy value"
  type        = string
  default     = "default"
}

# Enable DNS Support In VPC
variable "enable_dns_support" {
  description = "Sets Wheather AWS DNS support in vpc"
  type        = bool
  default     = true
}

# Enable DNS hostname for Instances in VPC
variable "enable_dns_hostnames" {
  description = "Sets Wheather instance in VPC have hostname or not"
  type        = bool
  default     = false
}

# Common Tags
variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}
