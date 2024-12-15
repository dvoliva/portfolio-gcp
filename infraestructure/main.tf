
#consumo de los modulos declarados

module "iam" {
  source         = "./modules/iam"
  project_id     = var.project_id
  api_depends_on = [google_project_service.services]
}

output "composer-svc" {
  value = module.iam.composer-svc
}

module "cloud-storage" {
  source      = "./modules/cloud-storage"
  bucket_name = "datapipeline-terraform-state"
  region_name = var.region_name
  project_id  = var.project_id
}

module "big-query" {
  source      = "./modules/big-query"
  region_name = var.region_name
  project_id  = var.project_id
}

module "cloud-composer" {
  source = "./modules/composer"
  region_name = var.region_name
  project_id = var.project_id
  composer-svc-email = module.iam.composer-svc
}
