terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket         = "s3-bucket-project-devops"
    key            = "expense-dev-vpc"
    region         = "us-east-1"
    dynamodb_table = "dynamoDB-table-project"
  }
}
provider "aws" {
  region = "us-east-1"
}

