resource "google_eventarc_trigger" "this" {
  project  = var.project_id
  name     = var.trigger_name
  location = var.location

  matching_criteria {
    attribute = "type"
    value     = var.event_type
  }

  destination {
    cloud_run_service {
      service = var.cloud_run_service
      region  = var.location
    }
  }

  service_account = var.service_account
}