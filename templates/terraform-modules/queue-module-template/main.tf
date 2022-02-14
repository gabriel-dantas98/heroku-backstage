provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-states"
    region  = "us-east-1"
    key     = "${{ values.queue_name }}"
  }
}

module "sqs" {

  source = "git::https://github.com/terraform-aws-modules/terraform-aws-sqs"
  source = "../"

  version = "~> 2.0"

  name = "${{ values.queue_name }}"

  tags = {
    Owner     = "${{ values.owner }}"
    Service = "${{ values.component_owner_id }}"
  }
}
