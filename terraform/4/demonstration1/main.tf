terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

#создаем облачную сеть
#resource "yandex_vpc_network" "develop" {
#  name = "develop"
#}

#создаем подсеть
#resource "yandex_vpc_subnet" "develop" {
#  name           = "develop-ru-central1-a"
#  zone           = "ru-central1-a"
#  network_id     = yandex_vpc_network.develop.id
#  v4_cidr_blocks = ["10.0.1.0/24"]
#}

#модуль test-vm
module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = module.secondary_net_sub.secondary_network_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ module.secondary_net_sub.secondary_subnet_id ]
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }
}
#модуль vpc-net-sub
module "secondary_net_sub" {
  source = "./secondary_net_sub"
  
}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")

 vars = {
  ssh_public_key = file("~/.ssh/id_rsa.pub")
 }
}

