###cloud vars

variable "vm_db_compute_image" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_compute_name" {
  type = string
  default = "platform-db"
}

variable "vm_db_compute_platform" {
  type = string
  default = "standard-v1"
}
