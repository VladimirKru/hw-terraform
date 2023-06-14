###cloud vars

variable "vm_resources" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    "vm_web_resources" = {
      cores = 2
      memory = 1
      core_fraction = 20      
    }
    "vm_db_resources" = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}

variable "vm_web_compute_image" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_compute_name" {
  type = string
  default = "platform-web"
}

variable "vm_web_compute_platform" {
  type = string
  default = "standard-v1"
}

variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars
variable "meta" {
  type = map(object({
    serial-port-enable = number
    ssh_keys = string
  }))
  default = {
    "ssh_root_key" = {
      serial-port-enable = 1
      ssh_keys = "ubuntu:id_ed25519.pub"
    }
  }
  
}