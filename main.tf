provider "google" {
  credentials = ""
  project = "aty-tst-350008"
  region = "us-central1"
  zone = "us-central1-a"
}

terraform {
  backend "gcs" {
    bucket  = "last-tst"
    prefix  = "terraform/state"
  }
}

resource "google_compute_instance" "mytst" {
  name = "mytst"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
        image = "ubuntu-2004-focal-v20220419"
    }
  }


 network_interface {
    network = "default"
}
}
