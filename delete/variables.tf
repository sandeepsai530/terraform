/* variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
} */

variable "instance_type" {
  default = "t2.micro"
}

variable "ec_tags" {
  type = map(any)
  default = {
    project     = "expense"
    component   = "backend"
    Environment = "prod"
    Name        = "expense-backend-dev"
  }
}

variable "sg_tags" {
  type = map
  default = {
    Name = "terraform-sg"
  }
}

variable "instance_name" {
    type = map  
  default = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t3.small"
    }
} 

variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "zone_id" {
  default = "Z0920272EA0FSP8H70OY"
}

variable "domain_name" {
  default = "saisandeep-devops.xyz"
}