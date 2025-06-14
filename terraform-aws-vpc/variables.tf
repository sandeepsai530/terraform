#mandatory
variable "vpc_cidr" {
  
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "project_name" {
  
}

variable "environment" {
  
}

variable "common_tags" {
  type = map
}

variable "vpc_tags" {
  default = {}
}

variable "igw_tags" {
  default = {}
}

variable "public_subnet_cidr" {
    type = list
    validation {
      condition = length(var.public_subnet_cidr) ==2 
      error_message = "please provide 2 valid subnet cidr's"
    }
  
}

variable "public_subnet_tags" {
  default = {}
}

variable "private_subnet_cidr" {
    type = list
    validation {
      condition = length(var.private_subnet_cidr) ==2 
      error_message = "please provide 2 valid subnet cidr's"
    }
  
}

variable "private_subnet_tags" {
  default = {}
}

variable "database_subnet_cidr" {
    type = list
    validation {
      condition = length(var.database_subnet_cidr) ==2 
      error_message = "please provide 2 valid subnet cidr's"
    }
  
}

variable "database_subnet_tags" {
  default = {}
}

variable "nat_tags" {
  default = {}
}

variable "public_rt_tags" {
  default = {}
}

variable "private_rt_tags" {
  default = {}
}

variable "database_rt_tags" {
  default = {}
}

variable "is_peering_required" {
  default = false
}

variable "vpc_peering_tags" {
  default = {}
}