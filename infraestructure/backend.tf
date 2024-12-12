#almacenar el state en el bucket 'datapipeline-terraform-state'
terraform {
  backend "gcs" {
    bucket      = "datapipeline-terraform-state"
    prefix      = "terraform/state"
    credentials = "./datapipeline-442115-d2b6e4a9790b.json"
  }
}
