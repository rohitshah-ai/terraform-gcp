variable "project_id" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "location" {
  type    = string
  default = "asia-south1"
}

variable "versioning_enabled" {
  type    = bool
  default = true
}

variable "lifecycle_age_days" {
  type    = number
  default = 90
}