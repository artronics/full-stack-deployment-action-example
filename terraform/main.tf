terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }

  backend "s3" {
    bucket = "terraform-state-terraform-deployment-action-example"
    key    = "example"
    region = "eu-west-2"
  }
}

locals {
  project = "terraform_action"
  service = "app"
  environment = terraform.workspace

  name_prefix = "${local.project}-${local.service}-${local.environment}"
}
provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      project     = local.project
      environment = local.environment
    }
  }
}
