
output "gcs_bucket" {
  value = module.gcs.bucket_name
}

output "artifact_registry" {
  value = module.artifact_registry.repository_url
}

output "cloud_sql_connection_name" {
  value = module.cloud_sql.connection_name
}

output "vpc_name" {
  value = module.vpc.vpc_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_name" {
  value = module.vpc.subnet_name
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "subnet_cidr" {
  value = module.vpc.subnet_cidr
}
