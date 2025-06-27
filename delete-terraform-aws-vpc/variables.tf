variable "project_name" {
  
}

variable "environment" {
  
}

variable "vpc_cidr" {
  
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "common_tags" {
  type = map
  default = {}
}

variable "igw_tags" {
  default = {}
}

 variable "public_subnet_tags" {
  default = {}
} 

variable "public_subnet_cidrs" {
  type = list 
  validation {
    condition = length(var.public_subnet_cidrs) == 2
    error_message = "please provide 2 valid public CIDR's"
  }
}

 variable "private_subnet_tags" {
  default = {}
} 

variable "private_subnet_cidrs" {
  type = list 
  validation {
    condition = length(var.private_subnet_cidrs) == 2
    error_message = "please provide 2 valid private CIDR's"
  }
}

 variable "database_subnet_tags" {
  default = {}
} 

variable "database_subnet_cidrs" {
  type = list 
  validation {
    condition = length(var.database_subnet_cidrs) == 2
    error_message = "please provide 2 valid database CIDR's"
  }
}

variable "nat_gw_tags" {
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