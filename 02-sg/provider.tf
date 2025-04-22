terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "expense-bucket-9959"
    key    = "expense-dev-sg"
    region = "us-east-1"
    dynamodb_table = "expense-locking"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}