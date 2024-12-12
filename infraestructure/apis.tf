# apis.tf
resource "google_project_service" "services" {
  for_each = toset([
    "compute.googleapis.com",  # Requerido para Composer, Compute Engine
    "composer.googleapis.com", # Cloud Composer
    "bigquery.googleapis.com", # BigQuery
    "storage.googleapis.com",  # Cloud Storage
    "iam.googleapis.com",      # IAM
    "drive.googleapis.com",    # Google Drive
    "sheets.googleapis.com"    # Google Sheets
  ])

  project = var.project_id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy         = false
}
