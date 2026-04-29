# id of public subnet route table 
output "public_subnet_route_table_id" {
  description = "public subnet route table id"
  value       = aws_route_table.public_subnet_table.id
}

# id of private subnet route table
output "private_subnet_route" {
  description = "private subnet route table id"
  value = {
    for k, i in aws_route_table.private_route_table :
    k => i.id
  }
}