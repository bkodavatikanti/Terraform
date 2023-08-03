terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }
  }
  backend "s3" {
    bucket = "statelock461"
    key    = "timing"
    region = "ap-south-1"
    dynamodb_table = "slterraform461"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}