# Internet Gateway Id
output "internet_gateway_id" {
  description = "Id of internet gateway"
  value = aws_internet_gateway.internet_gateway.id
}