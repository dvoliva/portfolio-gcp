
#Almacenar el state de terraform
resource "google_storage_bucket" "bucket_for_tfstate" {
  name     = var.bucket_name
  location = var.region_name

  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

