terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    # bucket name where to keep terraform state file
    bucket  = "terraform-poc-us-east-1"
    profile = "default"
    encrypt = "true"
    key     = "ec2_sql/terraform_state"
    region  = "us-east-1"
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"
}

module "ec2_sql" {
  source = "../../modules/ec2"
  ami_id = "ami-0cce4fb33302cadcb"
  instance_type = "t2.xlarge"
  public_subnet_id = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
  depends_on = [ module.vpc ]
}

