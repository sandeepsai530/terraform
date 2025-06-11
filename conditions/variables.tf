variable "ami_id" {
    type = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
  default = "t2.micro"
}

variable "from_port" {
    type = number
  default = 22
}

variable "to_port" {
    type = number
  default = 22
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "ec2_tags" {
  type = map
  default = {
    Project = "expense"
    Component = "backend"
    Environment = "dev"
    Name = "expense-backend-dev"
  }
}

variable "sg_tags" {
  type = map
  default = {
    Name = "expense-backend-dev"
  }
}