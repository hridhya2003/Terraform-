variable "connector_name" {
  description = "Name of the Serverless VPC connector"
  type        = string
}

variable "region" {
  description = "Region for the VPC connector"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to attach the connector"
  type        = string
}

resource "google_vpc_access_connector" "serverless_connector" {
  name           = var.connector_name
  region         = var.region
  network        = var.vpc_id
  ip_cidr_range  = "10.10.0.0/28"
  max_throughput = 300  # Valid value: 200, 300, 400, 500, 600, 700, 800, 900, or 1000
  min_throughput = 200
}
output "serverless_connector" {
  value = google_vpc_access_connector.serverless_connector.id
}
