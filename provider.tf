terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # It is recommended to pin a specific version
    }
  }
}

# Configure the default AWS Provider
provider "aws" {
  region = "us-east-1"
}