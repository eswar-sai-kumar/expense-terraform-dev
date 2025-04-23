terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
   bucket         = "remote-state-saiku"
   key            = "expense-dev-sg"
   region         = "us-east-1"
   dynamodb_table = "remote-state-locking"
  }
}
provider "aws" {
  region = "us-east-1"
}

