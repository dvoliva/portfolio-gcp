# Crear dataset
resource "google_bigquery_dataset" "test_dataset_tf" {
  project = var.project_id
  dataset_id = "first_tf_dataset"
  friendly_name = "test"
  description = "dataset de prueba con tf"
  location = var.region_name
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

}


# Crear tabla
resource "google_bigquery_table" "test_table" {
  dataset_id = google_bigquery_dataset.test_dataset_tf.dataset_id
  table_id = "table_from_tf"

  schema = jsonencode([
    {
      name = "column1"
      type = "STRING"
      mode = "NULLABLE"
    },
    {
      name = "column2"
      type = "INTEGER"
      mode = "NULLABLE"
    }
  ])

  labels = {
    env = "default"
  }

  deletion_protection = false
  depends_on = [ google_bigquery_dataset.test_dataset_tf ]
}


#Crear tabla a partir de GoogleSheets
resource "google_bigquery_table" "sheet" {
  dataset_id = google_bigquery_dataset.test_dataset_tf.dataset_id
  table_id   = "table_from_sheets"

  external_data_configuration {
    autodetect    = true
    source_format = "GOOGLE_SHEETS"

    google_sheets_options {
      skip_leading_rows = 1
    }

    source_uris = [
      "https://docs.google.com/spreadsheets/d/1gT_aIEZD5oHFw1NvaOqD5l-wIh892MELJ8jFAPGCX_M"
    ]
  }
}
