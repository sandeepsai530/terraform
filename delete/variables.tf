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
    type = list 
  default = ["mysqls", "backend", "frontend"]
} 

variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}
