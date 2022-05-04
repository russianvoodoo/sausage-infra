terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.74.0"
    }
  }
}

provider "yandex" {
  token     = "t1.9euelZqPmZzGkJXKls6Zmsmei42WmO3rnpWayM2dx53OyIvMjZiUi8bOi4nl8_docjZs-e8cPxU9_d3z9yghNGz57xw_FT39.wb7dmyfAiA7-Rcue6-1cYz3shY2mwjwDG7MsfHEg9RCz0gegQWYp6TYEiFnzTLgn-pIm-xXq_PAITtaYEKbSAw"
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gr94c4fmjnth6k8p36"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson2-russianvoodoo4"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8um17271hcbjirdqq1"
    }
  }

  network_interface {
    subnet_id = "e9bdi1h4rfet06lt0dkq"
    nat       = false
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
