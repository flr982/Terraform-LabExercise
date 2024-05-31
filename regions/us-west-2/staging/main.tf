terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  common_tags = {
    Project     = var.project
    Environment = var.env
    CreatedBy   = "Terraform"
    Region      = var.region
  }
  bucket_name          = "${var.project}.${var.region}.${var.env}"
  lambda_function_name = "${var.project}_${var.region}_${var.env}"
}

module "network" {
  source          = "../../../modules/network"
  vpc_cidr        = var.vpc_cidr
  subnet_cidrs    = var.subnet_cidrs
  security_groups = var.security_groups
  env             = var.env
  project         = var.project
  aws_region      = var.region
  common_tags     = local.common_tags
}

module "ec2" {
  source             = "../../../modules/ec2"
  project            = var.project
  env                = var.env
  aws_region         = var.region
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  subnet_id          = module.network.subnet_ids[0]
  security_group_ids = module.network.security_group_ids
  common_tags        = local.common_tags
}

module "s3" {
  source              = "../../../modules/s3"
  bucket_name         = local.bucket_name
  versioning          = var.versioning
  block_public_access = var.block_public_access
  common_tags         = local.common_tags
}

module "lambda" {
  source               = "../../../modules/lambda"
  project              = var.project
  env                  = var.env
  aws_region           = var.region
  lambda_function_name = local.lambda_function_name
  s3_bucket_name       = module.s3.bucket_id
  lambda_handler       = var.lambda_handler
  runtime              = var.runtime
  common_tags          = local.common_tags
}
