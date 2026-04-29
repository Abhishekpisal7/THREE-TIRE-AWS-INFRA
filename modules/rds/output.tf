output "database_endpoint" {
  description = "Endpoint of datbase subnet"
  value       = aws_db_instance.database.endpoint
}