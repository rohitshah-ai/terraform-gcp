variable "project_id" {
  type = string
}

variable "service_name" {
  type = string
}

variable "location" {
  type    = string
  default = "asia-south1"
}

variable "image" {
  type = string
}

variable "service_account" {
  type = string
}

variable "ingress" {
  type    = string
  default = "INGRESS_TRAFFIC_ALL"
}

variable "min_instances" {
  type    = number
  default = 0
}

variable "max_instances" {
  type    = number
  default = 10
}

variable "cpu" {
  type    = string
  default = "1"
}

variable "memory" {
  type    = string
  default = "512Mi"
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}