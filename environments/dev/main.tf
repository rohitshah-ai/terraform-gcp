module "app_service_account" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//iam"

  project_id          = var.project_id
  service_account_id  = "app-dev"
  display_name        = "Application Dev Service Account"

  roles = [
    "roles/storage.objectAdmin",
    "roles/cloudsql.client",
    "roles/secretmanager.secretAccessor"
  ]
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

  project_id           = var.project_id
  bucket_name          = "${var.project_id}-app-dev"
  location             = var.region
  versioning_enabled   = true
  lifecycle_age_days   = 30
}

module "cloud_sql" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//cloud-sql"

  project_id          = var.project_id
  instance_name       = "app-dev-db"
  database_name       = "app"
  region              = var.region
  tier                = "db-f1-micro"
  deletion_protection = false
}

module "cloud_run" {
  source = "git::https://github.com/rohitshah-ai/terraform-gcp-module.git//cloud-run"

  project_id       = var.project_id
  service_name     = "app-dev"
  location         = var.region

  image = "${var.region}-docker.pkg.dev/${var.project_id}/app-dev/app:latest"

  service_account = module.app_service_account.email

  min_instances = 0
  max_instances = 3

  environment_variables = {
    ENVIRONMENT = "dev"
  }
}
