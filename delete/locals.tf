locals {
  ami_id = data.aws_ami.joindevops.id
  instance_tags = [
  for name in var.instance_name : "${var.project}-${var.component}-${name}"
  ]
  //name = "${var.project}-${var.component}-${var.instance_name}"
}