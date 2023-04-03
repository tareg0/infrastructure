provider "aws" {
  region = var.region
}
// store tfstate file in S3
terraform {
  backend "s3" {
    bucket = "tromanovskiy"
    key = "infrastructure/network/terraform.tfstate"
    region = "eu-central-1"
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.env}-vpc"
  }
}