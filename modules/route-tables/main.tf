# Route tables
# public route table
resource "aws_route_table" "public_subnet_table" {
  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      "Name" = "Public-Route-table"
    }
  )
}

# Route for Public Route Table
resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_subnet_table.id
  destination_cidr_block = var.public_route_destination
  gateway_id             = var.internet_gateway_id
}

# public route table association
resource "aws_route_table_association" "public_rt_association" {
  for_each       = var.public_subnet_id
  subnet_id      = each.value
  route_table_id = aws_route_table.public_subnet_table.id
}

# route table
# Private Route Table
resource "aws_route_table" "private_route_table" {
  for_each = var.private_subnet_id
  vpc_id   = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      "Name" = "${each.key}-private-route-table"
    }
  )
}

# private route table destnation route 
resource "aws_route" "private_server_route" {
  for_each               = local.target_azs
  route_table_id         = aws_route_table.private_route_table[each.key].id
  destination_cidr_block = var.private_route_destination
  nat_gateway_id         = var.Nat_id[each.value]
}

# private route table association 
resource "aws_route_table_association" "private_rt_association" {
  for_each       = var.private_subnet_id
  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table[each.key].id
}