terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.92.0"
    }
  }
  backend "s3" {
    bucket = "s3bucket-project-devops"
    key    = "expense-dev-db"
    region = "us-east-1"
    dynamodb_table = "table-project-devops"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}