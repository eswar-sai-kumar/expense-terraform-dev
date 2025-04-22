terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  #backend "s3" {
  # bucket         = "THE_NAME_OF_THE_STATE_BUCKET"
   # key            = "some_environment/terraform.tfstate"
    #region         = "us-east-1"
    #dynamodb_table = "THE_ID_OF_THE_DYNAMODB_TABLE"
  #}
}
provider "aws" {
  region = "us-east-1"
}

