# database subnet id
variable "db_subnet_id" {
  description = "Id for database subnet"
  type = map(string)
}

# security group for rds
variable "database_sg" {
  description = "Database security group"
  type = string
}

# username of database
variable "username" {
  description = "username of db"
  type = string
}

# password of database
variable "password" {
  description = "password of db"
  type = string
}

# instance class
variable "instance_class" {
  description = "type of instance for rds"
  type = string
}

variable "common_tags" {
  description = "common tags"
  type = map(string)
}