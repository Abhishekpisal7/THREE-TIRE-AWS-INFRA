module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block

  common_tags = local.common_tags
}

module "internet-gateway" {
  source = "../../modules/internet-gateway"
  vpc_id = module.vpc.vpc_id

  common_tags = local.common_tags
}

module "subnet" {
  source = "../../modules/subnets"
  vpc_id = module.vpc.vpc_id
  azs = var.azs
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  db_subnet_cidr =  var.db_subnet_cidr

  common_tags = local.common_tags
}

module "nat-gateway" {
  source = "../../modules/nat-gateway"
  azs = var.azs
  subnet_id = module.subnet.public_subnet_id

  common_tags = local.common_tags
}

module "route-tables" {
  source = "../../modules/route-tables"
  azs = var.azs
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id
  internet_gateway_id = module.internet-gateway.internet_gateway_id
  Nat_id = module.nat-gateway.Nat_id

  common_tags = local.common_tags
}

module "security-groups" {
  source = "../../modules/security-groups"
  vpc_id = module.vpc.vpc_id
  ip_addr = var.ip_addr

  common_tags = local.common_tags
}

module "alb" {
  source = "../../modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id
  public_subnet_alb_sg = module.security-groups.private_subnet_lb_sg_id
  private_subnet_alb_sg =  module.security-groups.public_subnet_lb_sg_id
  
  common_tags = local.common_tags
}

module "autoscaling" {
  source = "../../modules/autoscaling"
  image_id = var.image_id
  key = var.asg_key
  instance_type = var.asg_instance_type
  public_subnet_id = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id
  public_subnet_tg_arn = module.alb.public_subnet_tg_arn
  private_subnet_tg_arn =  module.alb.private_subnet_tg_arn
  public_subnet_security_group_id = module.security-groups.public_subnet_lt_sg_id
  private_subnet_security_group_id = module.security-groups.private_subnet_lt_sg_id
  user_data_web = base64encode(file("../../scripts/userdata-web.sh"))
  
  common_tags = local.common_tags
}

module "bastion" {
  source = "../../modules/bastion"
  azs = var.azs
  ami = var.ami
  key = var.key
  instance_type = var.instance_type
  az_subnet = module.subnet.public_subnet_id
  vpc_security_group_ids = module.security-groups.bastion_sg_id

  common_tags =  local.common_tags
}

module "rds" {
  source = "../../modules/rds"
  db_subnet_id = module.subnet.db_subnet_id
  database_sg = module.security-groups.database_sg
  username = var.username
  password = var.password
  instance_class = var.instance_class

  common_tags = local.common_tags
}