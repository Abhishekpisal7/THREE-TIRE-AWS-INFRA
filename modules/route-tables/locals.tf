locals {
  target_azs = var.enable_single_nat_gateway ? zipmap(var.azs, [for i in var.azs : var.azs[0]]) : zipmap(var.azs, var.azs)
}