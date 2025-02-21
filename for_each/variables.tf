variable "instances" {
    type =map 
    default =  {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.medium"
    }
}
variable "domain_name" {
    default = "saisandeep-devops.online"
}

variable "zone_id" {
  default = "Z0920272EA0FSP8H70OY"
}
