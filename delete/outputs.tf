output "public_ip_address" {
  value = [for instance in aws_instance.expense : instance.public_ip]
}

output "ami_id" {
  value = data.aws_ami.joindevops.id
}