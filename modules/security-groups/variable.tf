# for VPC ID
variable "vpc_id" {
  description = "Value of VPC id"
  type        = string
}

# Private Ip for Bastion host
variable "ip_addr" {
  description = "My Ip Address"
  type        = string
}

# Comman Tags
variable "common_tags" {
  description = "Comman Tags"
  type        = map(string)
}