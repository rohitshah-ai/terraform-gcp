module "app_service_account" {
  source = "../../modules/iam"

  project_id         = var.project_id
  service_account_id = "app-prod"
  display_name       = "Application Prod Service Account"

  roles = [
    "roles/storage.objectAdmin",
    "roles/cloudsql.client",
    "roles/secretmanager.secretAccessor"
  ]
}

module "artifact_registry" {
  source = "../../modules/artifact-registry"

  project_id    = var.project_id
  location      = var.region
  repository_id = "app-prod"
  description   = "Production Docker repository"
}

module "gcs" {
  source = "../../modules/gcs"

  project_id         = var.project_id
  bucket_name        = "${var.project_id}-app-prod"
  location           = var.region
  versioning_enabled = true
  lifecycle_age_days = 365
}

module "cloud_sql" {
  source = "../../modules/cloud-sql"

  project_id          = var.project_id
  instance_name       = "app-prod-db"
  database_name       = "app"
  region              = var.region
  tier                = "db-custom-2-7680"
  availability_type   = "REGIONAL"
  deletion_protection = true
  backup_enabled      = true
  point_in_time_recovery = true
}

module "cloud_run" {
  source = "../../modules/cloud-run"

  project_id   = var.project_id
  service_name = "app-prod"
  location     = var.region

  image = "${var.region}-docker.pkg.dev/${var.project_id}/app-prod/app:latest"

  service_account = module.app_service_account.email

  min_instances = 1
  max_instances = 10

  cpu    = "2"
  memory = "1Gi"

  environment_variables = {
    ENVIRONMENT = "prod"
  }
}