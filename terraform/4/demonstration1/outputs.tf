output "secondary_network_id" {
  value = module.secondary_net_sub.secondary_network_id
}

output "secondary_subnet_id" {
  value = module.secondary_net_sub.secondary_subnet_id
}

output "secondary_subnet_netmask" {
  value = module.secondary_net_sub.secondary_subnet_netmask[0]
}