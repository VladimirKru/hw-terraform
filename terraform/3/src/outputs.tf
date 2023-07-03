locals {
  vm_count_info = [
    for vm in yandex_compute_instance.web.*:
    {
        name = vm ["name"]
        id = vm ["id"]
        fqdn = vm ["fqdn"]
    }
  ]
  vm_for_each_info = [
    for vm in yandex_compute_instance.each-vm:
    {
        name = vm ["name"]
        id = vm ["id"]
        fqdn = vm ["fqdn"]
    }
  ]

  vm_storage_info = [
    {
        name = yandex_compute_instance.vol-vm.name
        id = yandex_compute_instance.vol-vm.id
        fqdn = yandex_compute_instance.vol-vm.fqdn
    }
  ]
}

output "vm-count-info" {
  value = local.vm_count_info  

}

output "vm-each-info" {
  value = local.vm_for_each_info

}

output "vm-storage-info" {
  value = local.vm_storage_info

}


