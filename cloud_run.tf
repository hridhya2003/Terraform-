variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
}

variable "image" {
  description = "Container image for the Cloud Run service"
  type        = string
}

variable "vpc_connector" {
  description = "VPC connector to be used by Cloud Run"
  type        = string
}

variable "location" {
  description = "Region for the Cloud Run service"
  type        = string
}

resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.location

  template {
    spec {                                                                                                            ports {
  type        = string
}

variable "location" {
  description = "Region for the Cloud Run service"
  type        = string
}

resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.location

  template {
    spec {container_port = 8080
      co}tainers {
      } image = var.image
        resocpu    = "2"
        # Autoscaling settingsccount to avoid permission issues
      se"autoscaling.knative.dev/minScale" = "1"geless-camp-456617-i0.iam.gserviceaccount.com"
    }   "autoscaling.knative.dev/maxScale" = "5"                                               "autoscaling.knative.dev/maxScale" = "5"
        "autoscaling.knative.dev/minScale" = "1"
        # VPC connector settings
        "run.googleapis.com/vpc-access-connector" = var.vpc_connector
        "run.googleapis.com/vpc-access-egress" = "all-traffic"
  }   }
    }
  traffic {
    percent         = 100
    latest_revision = true
  }
}

output "service_url" { make the service publicly accessible
  value = google_cloud_run_service.service.status[0].url
}
