module "mysql_sg" {
  source = "../delete-terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags
  sg_name = "mysql"
  description = "created for MySQL"
  vpc_id = data.aws_ssm_parameter.vpc_id
}