variable "project_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-south1"
}

variable "database_version" {
  type    = string
  default = "POSTGRES_16"
}

variable "tier" {
  type    = string
  default = "db-f1-micro"
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "availability_type" {
  type    = string
  default = "ZONAL"
}

variable "backup_enabled" {
  type    = bool
  default = true
}

variable "point_in_time_recovery" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type    = bool
  default = true
}