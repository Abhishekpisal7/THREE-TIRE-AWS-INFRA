# VPC module
resource "aws_vpc" "project_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.common_tags,
    {
      "Name" = "THREE-TIER-AWS-INFRA"
    }
  )
}
