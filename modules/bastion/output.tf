output "bastion_host_id" {
  description = "Id Of bastion host"
  value = {
    for az, i in aws_instance.bastion_host:
        az => i.id
  }
}

# ip of the bastion host subnet
output "bastion_host_ip" {
  description = "ip of bastion host"
  value = {
    for az, i in aws_instance.bastion_host:
      az => i.public_ip
  }
}