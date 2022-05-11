terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.74.0"
    }
  }
}

provider "yandex" {
  token     = "t1.9euelZqJm5aVjJzPj5qTl5bGmY2Pk-3rnpWayM2dx53OyIvMjZiUi8bOi4nl8_cEKRFs-e94FDAY_d3z90RXDmz573gUMBj9._ebIpXIEMuyTUjRquDDNo_OSIHrkTN4A2G5OA4r5rBG-rRu5SQWBbNXoJ4Vv2p38228n-Wn4csm716lZ7HPLAw"
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
      image_id = "fd80qm01ah03dkqb14lc"
    }
  }

  network_interface {
    subnet_id = "e9bdi1h4rfet06lt0dkq"
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
