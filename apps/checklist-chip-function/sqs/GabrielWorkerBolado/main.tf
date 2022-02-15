provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-states"
    region  = "us-east-1"
    key     = "{{ cookiecutter.queue_name }}"
  }
}

module "sqs" {

  source = "git::https://github.com/terraform-aws-modules/terraform-aws-sqs"
  version = "~> 2.0"

  name = "{{ cookiecutter.queue_name }}"
  
  tags = {
    Owner   = "{{ cookiecutter.owner }}"
    Service = "{{ cookiecutter.component_owner_id }}"
  }

}
