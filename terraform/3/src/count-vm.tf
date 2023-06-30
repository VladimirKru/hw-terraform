resource "yandex_compute_instance" "web" {
    count = 2
    name = "netology-develop-platform-web-${count.index+1}"
    platform_id = "standard-v1"

    resources {
      cores = 2
      memory = 1
      core_fraction = 20
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

    scheduling_policy { preemptible = true }

    network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    }
    allow_stopping_for_update = true
}
