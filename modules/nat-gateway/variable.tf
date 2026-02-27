# Lists of Azs for Nat gateway
variable "azs" {
  description = "Value of AZS"
  type = list(string)
}

# Enable Single or multiple Nat Gateway
variable "enable_single_nat_gateway" {
  description = "Enable Single Nat Gateway"
  type = bool
  default = true
} 

#Id fo Public Subnet for NAT
variable "subnet_id" {
  description = "Public Subnet For NAT Gateway"
  type = map(string)
}

# Comman Tags
variable "common_tags" {
  description = "Common Tags"
  type = map(string)
}