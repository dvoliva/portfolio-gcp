#almacenar el state en el bucket 'datapipeline-terraform-state'
terraform {
  backend "gcs" {
    bucket      = "datapipeline-terraform-state"
    prefix      = "terraform/state"
    credentials = "./datapipeline-442115-05bad4e29e08.json"
  }
}
