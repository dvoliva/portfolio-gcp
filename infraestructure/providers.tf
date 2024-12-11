#definir proveedor: GCP

provider "google" {
  credentials = var.credentials_json_filepath
  project     = var.project_id
  region      = var.region_name
}