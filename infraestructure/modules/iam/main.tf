#crear cuenta de servicio para Big Query

// IAM BIG QUERY
#crear cuenta de servicio para BigQuery
resource "google_service_account" "bq_service_account" {
  account_id   = "bigquery-svc"
  display_name = "Service Account For Big Query"
  depends_on   = [var.api_depends_on]
}

#otorgar permisos a la cuenta de servicio de Big Query
resource "google_project_iam_member" "bq_service_account_binding" {
  project = var.project_id
  role    = "roles/bigquery.admin"
  member  = "serviceAccount:${google_service_account.bq_service_account.email}"
}

#otorgar permisos a la cuenta de servicio de Big Query para trabajar con google sheets
# resource "google_project_iam_member" "svc_token_creator" {
#   project = var.project_id
#   role    = "roles/iam.serviceAccountTokenCreator"
#   member  = "serviceAccount:${google_service_account.bq_service_account.email}"
# }


//  IAM CLOUD STORAGE

#Crear la cuenta de servicio para Cloud Storage
resource "google_service_account" "gcs_service_account" {
  account_id   = "cloud-storage-svc"
  display_name = "Service Account For Google Cloud Storage"
  depends_on   = [var.api_depends_on]
}

#definir permisos/roles de la cuenta de servicio de Cloud Storage
resource "google_project_iam_custom_role" "cs-custom-role" {
  role_id     = "datapipeline_roles_cloudstorage"
  title       = "Cloud Storage Service Account Roles"
  description = " "
  permissions = [
    "storage.objects.get",         # Permite leer objetos en un bucket
    "storage.objects.create",      # Permite crear nuevos objetos en un bucket
    "storage.objects.delete",      # Permite eliminar objetos en un bucket
    "storage.objects.list",        # Permite listar objetos dentro de un bucket
    "storage.buckets.get",         # Permite obtener metadatos de los buckets
    "storage.buckets.list",        # Permite listar todos los buckets en el proyecto
    "storage.objects.update"       # Permite actualizar metadatos de objetos
  ]
}

#otorgar permisos/roles a la cuenta de servicio de Cloud Storage
resource "google_project_iam_member" "storage_service_account" {
  project = var.project_id
  role    = google_project_iam_custom_role.cs-custom-role.name
  member  = "serviceAccount:${google_service_account.gcs_service_account.email}"
}


// IAM CLOUD COMPOSER

#definir permisos/roles de la cuenta de servicio de Cloud Composer
resource "google_service_account" "composer_service_account" {
  account_id   = "cloud-composer-svc"
  display_name = "Service Account For Cloud Composer"
  depends_on   = [var.api_depends_on]
}

#definir permisos/roles de la cuenta de servicio de Cloud Composer
resource "google_project_iam_custom_role" "composer-custom-role" {
  role_id     = "datapipeline_roles_composer"
  title       = "Cloud Composer Service Account Roles"
  description = " "
  permissions = [
    "composer.environments.create",   # Permite crear entornos de Composer
    "composer.environments.delete",   # Permite eliminar entornos de Composer
    "composer.environments.get",      # Permite obtener detalles de entornos de Composer
    "composer.environments.list",     # Permite listar entornos de Composer
    "composer.environments.update",   # Permite actualizar entornos de Composer
    "composer.operations.get",        # Permite obtener detalles de operaciones de Composer
    "composer.operations.list",       # Permite listar operaciones de Composer
    "storage.objects.get",            # Permite leer objetos en un bucket (acceso a DAGs)
    "storage.objects.create",         # Permite crear nuevos objetos en un bucket (almacenar resultados)
    "storage.objects.delete",         # Permite eliminar objetos en un bucket
    "storage.objects.list"            # Permite listar objetos dentro de un bucket
  ]
}

#otorgar permisos/roles a la cuenta de servicio de Cloud Composer
resource "google_project_iam_member" "composer_service_account" {
  project = var.project_id
  role    = google_project_iam_custom_role.composer-custom-role.name
  member  = "serviceAccount:${google_service_account.composer_service_account.email}"
}
