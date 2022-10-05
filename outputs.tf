output "external_ip" {
  description = "External IP of Retool instance"
  value       = google_compute_instance.compute_instance.network_interface[0].access_config[0].nat_ip
}
