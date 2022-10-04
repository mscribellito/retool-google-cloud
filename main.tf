provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "project" {
  for_each = toset(var.apis_and_services)

  project = var.project_id
  service = each.value
}

resource "google_service_account" "service_account" {
  account_id   = "retool"
  display_name = "Retool Service Account"
}

resource "google_project_iam_member" "project" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

data "google_compute_zones" "available" {
}

resource "google_compute_instance" "compute_instance" {
  name         = "retool"
  machine_type = var.machine_type
  zone         = data.google_compute_zones.available.names[0]

  boot_disk {
    initialize_params {
      size  = var.disk_size_gb
      type  = var.disk_type
      image = var.disk_image
    }
  }

  network_interface {
    network = var.network
    access_config {
    }
  }

  metadata_startup_script = templatefile("retool.sh", {
    version     = var.retool_version
    license_key = var.retool_license_key
  })

  service_account {
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }

  tags = ["retool"]
}

resource "google_compute_firewall" "firewall" {
  name    = "retool"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "3000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["retool"]
}