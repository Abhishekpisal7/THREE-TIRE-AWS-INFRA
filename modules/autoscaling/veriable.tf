# ami id for launch template
variable "image_id" {
  description = "ami id for launch template"
  type = string
}

# key name for launch template
variable "key" {
  description = "key for launch template"
  type = string
}

# instance type for launch templatec
variable "instance_type" {
  description = "instance type for launch template"
  type = string
}

# securtiy group for launch template
variable "public_subnet_security_group_id" {
  description = "security group for public subnet launch template"
  type = string
}

# security group for private subnet instance
variable "private_subnet_security_group_id" {
  description = "security group for private subnet launch template"
  type = string
}

# public subnet id for asg in public subnet
variable "public_subnet_id" {
  description = "id of public subnet for asg"
  type = map(string)
}

# private subnet id for asg in private subnet
variable "private_subnet_id" {
  description = "id of private subnet for asg"
  type = map(string)
}

# public subnet tg arn for public asg 
variable "public_subnet_tg_arn" {
  description = "public subnet tg arn for asg"
  type = string
}

# private subnet tg arn for private asg
variable "private_subnet_tg_arn" {
  description = "private subnet tg arn for asg"
  type = string
}

variable "common_tags" {
  description = "common tags"
  type = map(string)
}