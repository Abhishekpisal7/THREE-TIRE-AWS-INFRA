# For Public Subnet 
resource "aws_subnet" "public_subnet" {
  for_each                = zipmap(var.azs, var.public_subnet_cidr)
  vpc_id                  = var.vpc_id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      "Name" = "${each.key}-public-subnet"
    }
  )
}

#  For Private Subnet
resource "aws_subnet" "private_subnet" {
  for_each                = zipmap(var.azs, var.private_subnet_cidr)
  vpc_id                  = var.vpc_id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = false

  tags = merge(
    var.common_tags,
    {
      "Name" = "${each.key}-private-subnet"
    }
  )
}

# for database subnet 
resource "aws_subnet" "db_subnet" {
  for_each                = zipmap(var.azs, var.db_subnet_cidr)
  vpc_id                  = var.vpc_id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = false

  tags = merge(
    var.common_tags,
    {
      "Name" = "${each.key}-database-subnet"
    }
  )
}