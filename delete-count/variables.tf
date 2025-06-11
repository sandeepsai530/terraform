variable "instance" {
    type = list
  default = [ "mysql" , "backend" , "frontend" ]
}

variable "zone_id" {
  type = string
  default = "Z0920272EA0FSP8H70OY"
}

variable "domain_name" {
  type = string
  default = "saisandeep-devops.xyz"
}