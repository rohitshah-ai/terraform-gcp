module "app_service_account" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//iam"

  project_id         = var.project_id
  service_account_id = "app-dev"
  display_name       = "Application Dev Service Account"

  roles = [
    "roles/storage.objectAdmin",
    "roles/cloudsql.client",
    "roles/secretmanager.secretAccessor"
  ]
}

module "vpc" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//vpc"

  project_id  = var.project_id
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region

  bgp_routing_mode             = var.bgp_routing_mode
  bgp_best_path_selection_mode = var.bgp_best_path_selection_mode
}

module "artifact_registry" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//artifact-registry"

  project_id    = var.project_id
  location      = var.region
  repository_id = "app-dev"
  description   = "Dev Docker repository"
}

module "gcs" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//gcs"

  project_id         = var.project_id
  bucket_name        = "${var.project_id}-app-dev"
  location           = var.region
  versioning_enabled = true
  lifecycle_age_days = 30
}

module "cloud_sql" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//cloud-sql"

  project_id          = var.project_id
  instance_name       = "app-dev-db"
  database_name       = "app"
  region              = var.region_db
  tier                = "db-perf-optimized-N-2"
  deletion_protection = false
}

module "cloud_run" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//cloud-run"

  project_id   = var.project_id
  service_name = "app-dev"
  location     = var.region

  image = "${var.region}-docker.pkg.dev/${var.project_id}/app-dev/app:latest"

  service_account = module.app_service_account.email

  min_instances = 0
  max_instances = 3

  environment_variables = {
    ENVIRONMENT = "dev"
  }
}
