resource "google_composer_environment" "composer_etl" {
  name   = "example-composer-env-tf-c2"
  region = "us-central1"
  config {

    software_config {
      image_version = "composer-2-airflow-2"
    }

    workloads_config {
      scheduler {
        cpu        = 0.5
        memory_gb  = 1
        storage_gb = 1
        count      = 1
      }
      web_server {
        cpu        = 0.5
        memory_gb  = 1
        storage_gb = 1
      }
      worker {
        cpu = 0.5
        memory_gb  = 1
        storage_gb = 1
        min_count  = 1
        max_count  = 3
      }


    }
    environment_size = "ENVIRONMENT_SIZE_SMALL"

    node_config {
      network    = google_compute_network.test_etl_ntwk.id
      subnetwork = google_compute_subnetwork.test_etl_subntwk.id
      service_account = var.composer-svc-email
    }
  }
}

resource "google_compute_network" "test_etl_ntwk" {
  name                    = "composer-test-network3"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "test_etl_subntwk" {
  name          = "composer-test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region_name
  network       = google_compute_network.test_etl_ntwk.id
}

