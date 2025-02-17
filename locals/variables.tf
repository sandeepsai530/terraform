variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "description"
}

variable "project" {
  default = "expense"
}

variable "component" {
  default = "backend"
}

variable "environemnt" {
  default = "dev"
}
