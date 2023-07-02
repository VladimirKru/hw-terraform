resource "yandex_compute_disk" "vol" {
    count = 3

    name = "vol-${count.index}"
    type = "network-hdd"
    zone = "ru-central1-a"
    size = 1
      
}