terraform {
  backend "gcs" {
    bucket = "invoice-processing-terraform-state"
    prefix = "terraform/dev"
  }
}
