variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "This is RHEL9 AMI ID"
}

variable "environment" {
    default = "dev"  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "instance type"
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

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map
  default = {
    name = "expense-backend-dev"
  }
}