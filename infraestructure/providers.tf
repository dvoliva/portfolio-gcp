#definir proveedor: GCP

provider "google" {
  credentials = var.credentials_json_filepath
  project     = var.project_id
  region      = var.region_name
  scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
        "https://www.googleapis.com/auth/userinfo.email",
        "https://www.googleapis.com/auth/drive.readonly"
  ]
}
