variable "project_id" {
  type = string
}

variable "region_name" {
  type    = string
  default = "us-central1"
}

variable "bucket_name" {
  type = string
  description = "bucket for Terraform State"
}
