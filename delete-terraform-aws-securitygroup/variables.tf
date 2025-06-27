variable "project_name" {
  
}

variable "environment" {
  
}

variable "sg_name" {
  
}

variable "description" {
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "vpc_id" {
  
}

variable "common_tags" {
  type = map 
}

variable "sg_tags" {
  default = {}
}