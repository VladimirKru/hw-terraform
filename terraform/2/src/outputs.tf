output "vm_external_ip_address" {
    value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    description = "vm external ip"
}

output "vm_external_ip_address2" {
    value = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
    description = "vm external ip"
}