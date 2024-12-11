variable "project_id" {
  type = string
}

variable "api_depends_on" {
  description = "Lista de APIs"
  type = any
  default = []
}