resource "random_id" "unique_sufix" {
  byte_length = 4
}

output "resource_name" {
  value = "resource-${random.id_unique_suffix_hex}"
}

