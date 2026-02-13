terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}

provider "aws" {
  alias  = "aps-1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "aps-2"
  region = "ap-south-2"
}
