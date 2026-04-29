# NAT Gateway EIP
output "Nat_ip" {
  description = "Ip adderesss of Nat Gateway"
  value = {
    for k, nat in aws_nat_gateway.nat_gateway :
    k => nat.id
  }
}

# ID of the NAT Gateway
output "Nat_id" {
  description = "Id of the Nat Gateway"
  value = {
    for k, nat in aws_nat_gateway.nat_gateway :
    k => nat.id
  }
}

