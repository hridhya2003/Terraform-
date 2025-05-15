provider "google" {
  # Using credentials file
  credentials = file("terraform-key.json")
  project     = "ageless-camp-456617-i0"
  region      = "us-central1"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_name = "my-vpc"
}

module "frontend_subnet" {
  source      = "./modules/subnet"
  subnet_name = "frontend-subnet"
  vpc_id      = module.vpc.vpc_id
  cidr_range  = "10.0.1.0/24"
  region      = "us-central1"
}

module "backend_subnet" {
  source      = "./modules/subnet"
  subnet_name = "backend-subnet"
  vpc_id      = module.vpc.vpc_id
  cidr_range  = "10.0.2.0/24"
  region      = "us-central1"
}

module "ml_test_subnet" {
  source      = "./modules/subnet"
  subnet_name = "ml-test-subnet"
  vpc_id      = module.vpc.vpc_id
  cidr_range  = "10.0.3.0/24"
  region      = "us-central1"
}

module "serverless_vpc" {
  source         = "./modules/serverless_vpc"
  connector_name = "my-serverless-connector"
  vpc_id         = module.vpc.vpc_id  # Changed back to vpc_id based on your modules
  region         = "us-central1"
}

module "cloud_run_service" {
  source         = "./modules/cloud_run"
  service_name   = "my-cloud-run-service"
  image          = "gcr.io/google-samples/hello-app:1.0"  # This image listens on $PORT by default
  vpc_connector  = module.serverless_vpc.serverless_connector
  location       = "us-central1"
}

output "cloud_run_url" {
  value = module.cloud_run_service.service_url
}
