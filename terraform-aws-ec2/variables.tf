variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"

  #conditions in terraform 
  validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "valid values for instance type are: t3.small/t3.micro/t3.medium"
  }
}

#if declared as below the n variable is considered as mandatory
variable "sg_id" {
}

#if declared as below the n variable is considered as optional
variable "tags" {
  default = {}
}