variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east1"
}

variable "apis_and_services" {
  type = list(string)
  default = [
    "compute.googleapis.com"
  ]
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "disk_size_gb" {
  type    = number
  default = 60
}

variable "disk_type" {
  type    = string
  default = "pd-ssd"
}

variable "disk_image" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-2204-jammy-v20220924"
}

variable "network" {
  type    = string
  default = "default"
}

variable "retool_version" {
  type        = string
  description = "Retool version number from https://docs.retool.com/docs/self-hosted-release-notes"
}

variable "retool_license_key" {
  type        = string
  description = "Retool license key from https://my.retool.com"
}

variable "roles" {
  type = list(string)
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
  ]
}