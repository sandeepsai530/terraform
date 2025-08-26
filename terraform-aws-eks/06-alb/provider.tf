
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.89.0"
    }
  }

  backend "s3" {
    bucket = "terraform-eks-state-locks-sai123" #bucket only for one project s3 bucket
    key    = "eks-alb"
    region = "us-east-1"
    dynamodb_table = "terraform-eks-state-locks-sai123"   #only for one table
  }
}
provider "aws" {
  # Configuration options
}
