module "mysql_sg" {
  //source = "../terraform-aws-securitygroup"
  source = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "mysql"
  sg_description = "created for MySQL instances in expense dev"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}

module "backend_sg" {
  //source = "../terraform-aws-securitygroup"
  source = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "backend"
  sg_description = "created for backend instances in expense dev"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}

module "frontend_sg" {
  //source = "../terraform-aws-securitygroup"
  source = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "frontend"
  sg_description = "created for frontend instances in expense dev"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}

module "bastion_sg" {
  //source = "../terraform-aws-securitygroup"
  source = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "bastion"
  sg_description = "created for bastion instances in expense dev"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
}