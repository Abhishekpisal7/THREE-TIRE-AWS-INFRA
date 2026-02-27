# subnet group for databse 
resource "aws_db_subnet_group" "database_subnet_group" {
  name = "rds-subnet-group"
  subnet_ids = values(var.db_subnet_id)

  tags = merge(
    var.common_tags,
    {
       "Name" = "rds-subnet-group"
    }
  )
}

# rds 
resource "aws_db_instance" "database" {
  identifier = "my-rds-instance"
  engine = "mysql"
  instance_class = var.instance_class

  storage_type = "gp2"
  allocated_storage = 10
  max_allocated_storage = 20
  storage_encrypted = true

  db_name = "mydb"
  username = var.username
  password = var.password

  publicly_accessible = false
  multi_az = true
  skip_final_snapshot = true
  vpc_security_group_ids = [ var.database_sg ]
  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name

  tags = merge(
    var.common_tags,
    {
        "Name" = "database"
    }
  )

}