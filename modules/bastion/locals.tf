locals {
  target_subnet = var.enable_single_bastion_host ? zipmap([var.azs[0]], [values(var.az_subnet)[0]]) : zipmap(var.azs, var.az_subnet)
}