# Bastion host placeholder
resource "aws_instance" "bastion_host" {
  for_each = local.target_subnet
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  availability_zone = each.key
  subnet_id = each.value
  vpc_security_group_ids = [ var.vpc_security_group_ids ]

  tags = merge(
    var.common_tags,
    {
        "Name" = "Bastion-host"
    }
  )
}