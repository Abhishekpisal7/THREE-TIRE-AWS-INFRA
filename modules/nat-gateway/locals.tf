locals {
  target_azs = var.enable_single_nat_gateway? [var.azs[0]] : var.azs
}