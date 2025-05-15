variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to attach the subnet to"
  type        = string
}

variable "cidr_range" {
  description = "CIDR range for the subnet"
  type        = string
}

variable "region" {
  description = "Region for the subnet"
  type        = string
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.cidr_range
  region        = var.region
  network       = var.vpc_id
}

output "subnet_id" {
  value = google_compute_subnetwork.subnet.id
}
