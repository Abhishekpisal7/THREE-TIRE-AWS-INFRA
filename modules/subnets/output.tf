# Public Subnet Id
output "public_subnet_id" {
  description = "Id of the Public Subnet"
  value = {
    for az, i in aws_subnet.public_subnet : az => i.id
  }
}

# Private Subnet Id
output "private_subnet_id" {
  description = "Id for the Private Subnet"
  value = {
    for az, i in aws_subnet.private_subnet : az => i.id
  }
}

# database subnet id
output "db_subnet_id" {
  description = "Id of database subnet"
  value = {
    for az, i in aws_subnet.db_subnet : az => i.id
  }
}