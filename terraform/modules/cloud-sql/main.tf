resource "google_sql_database_instance" "this" {
  project          = var.project_id
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier              = var.tier
    availability_type = var.availability_type
    disk_type         = "PD_SSD"
    disk_size         = var.disk_size

    backup_configuration {
      enabled                        = var.backup_enabled
      point_in_time_recovery_enabled = var.point_in_time_recovery
    }

    ip_configuration {
      ipv4_enabled = true
    }
  }

  deletion_protection = var.deletion_protection
}

resource "google_sql_database" "this" {
  project  = var.project_id
  name     = var.database_name
  instance = google_sql_database_instance.this.name
}