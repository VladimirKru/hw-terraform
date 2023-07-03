resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { webservers =  yandex_compute_instance.web 
    databases = yandex_compute_instance.each-vm
    storage = [yandex_compute_instance.vol-vm]   }  )

  filename = "${abspath(path.module)}/hosts.cfg"
}