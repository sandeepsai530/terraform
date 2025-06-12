variable "project" {
 default =  "expense"
}

variable "environment" {
  
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
  default = "Z0920272EA0FSP8H70OY"
}

variable "domain_name" {
  default = "saisandeep-devops.xyz"
}

variable "common_tags" {
  type = map
  default = {
    project = "expense"
    Terraform = "true"
  }
}

/* variable "profile" {
  
} */