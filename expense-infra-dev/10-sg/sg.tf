module "mysql_sg" {
  //source = "../terraform-aws-securitygroup"
  source         = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "mysql"
  sg_description = "created for MySQL instances in expense dev"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

module "backend_sg" {
  //source = "../terraform-aws-securitygroup"
  source         = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "backend"
  sg_description = "created for backend instances in expense dev"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

module "frontend_sg" {
  //source = "../terraform-aws-securitygroup"
  source         = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "frontend"
  sg_description = "created for frontend instances in expense dev"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

module "bastion_sg" {
  //source = "../terraform-aws-securitygroup"
  source         = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "bastion"
  sg_description = "created for bastion instances in expense dev"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

module "app_alb_sg" {
  //source = "../terraform-aws-securitygroup"
  source         = "git::https://github.com/sandeepsai530/terraform.git//terraform-aws-securitygroup?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "app-alb"
  sg_description = "created for backend ALB in expense dev"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

#App ALB accepting traffic from bastion
resource "aws_security_group_rule" "app_alb_bastion" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.app_alb_sg.sg_id
}

#App ALB accepting traffic from bastion
resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["49.37.148.219/32"]
  security_group_id = module.bastion_sg.sg_id
}