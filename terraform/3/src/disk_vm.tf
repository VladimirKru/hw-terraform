resource "yandex_compute_disk" "vol" {
    count = 3

    name = "vol-${count.index}"
    type = "network-hdd"
    zone = "ru-central1-a"
    size = 1
      
}

resource "yandex_compute_instance" "vol-vm" {
    name = "storage"
    platform_id = "standard-v1"

    resources {
      cores = 2
      memory = 1
      core_fraction = 5
    }

    boot_disk {
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
        type = "network-hdd"
        size = 5
      }
    }

    dynamic "secondary_disk" {
        for_each = yandex_compute_disk.vol.*.id
        content {
          disk_id = secondary_disk.value
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
}