locals {
  #StringList to List
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
}