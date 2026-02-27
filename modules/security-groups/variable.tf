# for VPC ID
variable "vpc_id" {
  description = "Value of VPC id"
  type = string
}

# Private Ip for Bastion host
variable "ip_addr" {
  description = "My Ip Address"
  type = string
  default = "152.58.31.114/32"
}

# Comman Tags
variable "common_tags" {
  description = "Comman Tags"
  type = map(string)
}