terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

resource "yandex_vpc_network" "test" {
  name = "test"
}

resource "yandex_vpc_subnet" "test" {
  name           = "test-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.test.id
  v4_cidr_blocks = ["192.168.2.0/24"]
}