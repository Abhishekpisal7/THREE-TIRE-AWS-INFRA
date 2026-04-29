# EIP for Nat gateway
resource "aws_eip" "nat_eip" {
  for_each = toset(local.target_azs)

  tags = merge(
    var.common_tags,
    {
      "Name" = "${each.value}_Nat_eip"
    }
  )
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  for_each      = toset(local.target_azs)
  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id     = var.subnet_id[each.value]

  tags = merge(
    var.common_tags,
    {
      "Name" = "${each.value}_nat_gateway"
    }
  )
}