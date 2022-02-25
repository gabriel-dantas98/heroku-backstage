provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-states"
    region  = "us-east-1"
    key     = "FilaDoPao"
  }
}

module "sqs" {

  source = "git::https://github.com/terraform-aws-modules/terraform-aws-sqs"
  version = "~> 2.0"

  name = "FilaDoPao"
  
  tags = {
    Owner   = "boxoffice"
    Service = "FilaDoPao"
  }

}