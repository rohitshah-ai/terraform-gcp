variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-south1"
}
variable "cloudsql_region" {
  type    = string
  default = "us-east1"
}
variable "database_name" {
  description = "Application database name"
  type        = string
  default     = "invoice_db"
}

variable "database_username" {
  description = "Application database username"
  type        = string
  default     = "invoice_app"
}

variable "database_password" {
  description = "Application database password"
  type        = string
  sensitive   = true
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "bgp_routing_mode" {
  description = "BGP routing mode"
  type        = string
  default     = "REGIONAL"
}

variable "bgp_best_path_selection_mode" {
  description = "BGP best path selection mode"
  type        = string
  default     = "LEGACY"
}
