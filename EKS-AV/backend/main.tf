provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "sai-terraform-demo-av"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "av-dynamodb" {
  name = "terraform-eks-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}