data template_file "cloud_init" {
  template = file("${path.module}/templates/cloud_init.yaml")

  vars = {
    username           = var.username
    ssh_public_key     = file(var.ssh_public_key)
    packages           = jsonencode(var.packages)
  }
}