resource "yandex_compute_instance" "each-vm" {
            
    for_each = { main = {cpu = 2, ram = 1, fraction = 20}, 
    replica = {cpu = 4, ram = 2, fraction = 5}}

    name = "${each.key}"
    platform_id = "standard-v1"
    
    resources {
      cores = "${each.value.cpu}"
      memory = "${each.value.ram}"
      core_fraction = "${each.value.fraction}"
    }

    boot_disk {
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
        type = "network-hdd"
        size = 5
      }
    }

    metadata = {
        serial-port-enable = var.meta["ssh_root_key"].serial-port-enable
        ssh-keys           = var.meta["ssh_root_key"].ssh_keys
       
    }

    scheduling_policy {
      preemptible = true
    }

    network_interface {
      subnet_id = yandex_vpc_subnet.develop.id
      nat       = true
    }

depends_on = [yandex_compute_instance.web]

}