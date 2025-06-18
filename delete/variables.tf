variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec_tags" {
  type = map(any)
  default = {
    project     = "expense"
    component   = "backend"
    Environment = "dev"
    Name        = "expense-backend-dev"
  }
}

variable "sg_tags" {
  type = map(any)
  default = {
    Name = "terraform-sg"
  }
}