variable "project_id" {
  type = string
}

variable "region_name" {
  type    = string
  default = "us-central1"
}

variable "composer-svc-email" {
  description = "email of the service account for composer"
  type = string
}