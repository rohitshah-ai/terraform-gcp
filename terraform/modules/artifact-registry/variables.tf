variable "project_id" {
  type = string
}

variable "location" {
  type    = string
  default = "asia-south1"
}

variable "repository_id" {
  type = string
}

variable "description" {
  type    = string
  default = "Docker container repository"
}