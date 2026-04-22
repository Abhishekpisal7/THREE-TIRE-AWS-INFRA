# VPC Id for Internet Gateway
variable "vpc_id" {
  description = "VPC id for internet gateway"
  type = string
}

# common tags
variable "common_tags" {
  description = "common tags"
  type = map(string)
}