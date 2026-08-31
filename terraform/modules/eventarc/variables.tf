variable "project_id" {
  type = string
}

variable "trigger_name" {
  type = string
}

variable "location" {
  type    = string
  default = "asia-south1"
}

variable "event_type" {
  type = string
}

variable "cloud_run_service" {
  type = string
}

variable "service_account" {
  type = string
}