data "aws_ami" "joindevops" {
  most_recent = true
  owners = ["973714476881"]
  
  filter {
    name = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}
#fetching default VPC for my account in console output

data "aws_vpc" "default" {
  default = true
}

output "ami-id" {
    value = data.aws_ami.joindevops.id
}

output "default_vpc_id" {
  value = data.aws_vpc.default.id
}
