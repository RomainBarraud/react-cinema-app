provider "aws" {
    region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket  = "app-cinerma-romain-tf-state"
    key     = "app-cinema.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}

locals {
    prefix = "${var.prefix}-${terraform.workspace}"
    command_tags = {
        Environment = terraform.workspace
        Project = var.project
        ManagedBy = "Terraform"
        Owner = "Romain Barraud"
    }
}