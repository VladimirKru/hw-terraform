locals {
    develop = "netology-develop"
    web_name = "${local.develop}-${var.vm_web_compute_name}"
    db_name = "${local.develop}-${var.vm_db_compute_name}"
}