variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

#if declared as below the n variable is considered as mandatory
variable "sg_id" {
}

#if declared as below the n variable is considered as optional
variable "tags" {
  default = {}
}