output "cloud_run_url" {
  value = module.cloud_run.service_uri
}

output "gcs_bucket" {
  value = module.gcs.bucket_name
}

output "artifact_registry" {
  value = module.artifact_registry.repository_url
}

output "cloud_sql_connection_name" {
  value = module.cloud_sql.connection_name
}