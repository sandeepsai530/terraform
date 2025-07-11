variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "expense"
    Environment = "dev"
    terraform = "true"
  }
}

variable "zone_id" {
  default = "Z0920272EA0FSP8H70OY"
}

variable "domain_name" {
  default = "saisandeep-devops.xyz"
}