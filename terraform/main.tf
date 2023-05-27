provider "google" {
  credentials = file("<PATH_TO_YOUR_SERVICE_ACCOUNT_KEY_JSON_FILE>")
  project     = "<YOUR_PROJECT_ID>"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "instance"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
