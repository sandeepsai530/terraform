terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.84.0"
    }
  }

  backend "s3" {
    bucket = "devops-terraform-remote-state-sai"
    key = "ec2-demo" #you should have uniqueu keys with in the bucket. same key should not be used in other repos or tf projects
    region = "us-east-1"
    dynamodb_table = "devops-terraform-remote-state-sai"
  }
}
provider "aws" {
  region = "us-east-1"
}
