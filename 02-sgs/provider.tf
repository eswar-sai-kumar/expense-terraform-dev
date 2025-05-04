terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket         = "s3bucket-project-devops"
    key            = "expense-dev-sg"
    region         = "us-east-1"
    dynamodb_table = "use_lock"
  } 
}
provider "aws" {
  region = "us-east-1"
}

