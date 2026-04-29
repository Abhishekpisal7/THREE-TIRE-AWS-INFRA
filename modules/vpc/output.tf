# Output From the VPC
output "vpc_id" {
  description = "Contains the id of the VPC"
  value       = aws_vpc.project_vpc.id
}

