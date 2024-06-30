terraform {
  required_providers {
  }
  backend "s3" {

  }
}


provider "aws" {
  
  region = var.aws_region

}
