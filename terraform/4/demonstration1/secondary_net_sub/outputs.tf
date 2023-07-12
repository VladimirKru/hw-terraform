output "secondary_network_id" {
  value = yandex_vpc_network.test.id
}

output "secondary_subnet_id" {
  value = yandex_vpc_subnet.test.id
}

output "secondary_subnet_netmask" {
  value = yandex_vpc_subnet.test.v4_cidr_blocks
}